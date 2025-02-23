import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/models/message_model.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/core/utils/date_utils.dart';
import 'package:cross_platforme_mobile/app/core/widgets/circle_avatar_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/chat_messages_controller.dart';

class ChatMessagesView extends GetView<ChatMessagesController> {
  const ChatMessagesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: controller.obx(
            (state) => Row(
              children: [
                CircleAvatarWidget(
                  id: state?.recipient(controller.me!.id!).profileImageId,
                  raduis: 25,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${state?.recipient(controller.me!.id!).name}',
                      style: AppTextTheme.bodyLarge,
                    ),
                    Text('${state?.recipient(controller.me!.id!).email}',
                        style: AppTextTheme.bodyMedium),
                  ],
                ),
              ],
            ),
          ),
          centerTitle: false,
          titleSpacing: 0,
          actions: [
            IconButton(
              icon: Icon(Bootstrap.three_dots_vertical),
              onPressed: () {},
            ),
            SizedBox(width: 10),
          ],
        ),
        body: SafeArea(
          child: controller.obx(
            (state) => Column(
              children: [
                // display messages
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    reverse: true,
                    itemCount: state?.messages?.length,
                    itemBuilder: (context, index) {
                      final message = state?.messages?[index];
                      return _buildMessageWidget(message!);
                    },
                  ),
                ),
                // input message
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: AppColors.accent2,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.messageContentController,
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 7,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Bootstrap.send),
                        onPressed: controller.send,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onLoading: Center(child: CircularProgressIndicator.adaptive()),
            onEmpty: Column(
              children: [
                SizedBox(height: 40),
                Icon(Bootstrap.database),
                SizedBox(height: 10),
                Text('No chats found', style: AppTextTheme.bodyMedium),
              ],
            ),
            onError: (error) => Column(
              children: [
                SizedBox(height: 40),
                Icon(Bootstrap.exclamation_circle),
                SizedBox(height: 10),
                Text(error.toString()),
              ],
            ),
          ),
        ));
  }

  Widget _buildMessageWidget(MessageModel message) {
    return Row(
      children: [
        if (controller.me?.id != message.fromUser?.id)
          CircleAvatarWidget(
            id: message.fromUser?.profileImageId,
            raduis: 25,
            fit: BoxFit.cover,
          ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: controller.me?.id == message.fromUser?.id
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: controller.me?.id == message.fromUser?.id
                      ? AppColors.blue
                      : AppColors.accent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${message.content}',
                  style: AppTextTheme.bodySmall.copyWith(
                    color: controller.me?.id == message.fromUser?.id
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                '${dateAgo(message.createdAt)}',
                style: AppTextTheme.labelSmall,
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}

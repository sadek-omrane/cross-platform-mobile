import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/core/utils/bottom_sheet_factory.dart';
import 'package:cross_platforme_mobile/app/core/utils/date_utils.dart';
import 'package:cross_platforme_mobile/app/core/widgets/circle_avatar_widget.dart';
import 'package:cross_platforme_mobile/app/modules/chats/views/widgets/chat_form_widget.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Chats', style: AppTextTheme.titleSmall),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Bootstrap.plus_circle),
                onPressed: () {
                  controller.search();
                  BottomSheetFactory.show(
                    context: context,
                    child: ChatFormWidget(),
                  );
                },
              ),
              SizedBox(width: 10),
            ],
          ),
          // display chats list
          SliverToBoxAdapter(
            child: controller.obx(
              (state) => ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                itemCount: state?.length,
                itemBuilder: (context, index) {
                  final chat = state![index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      Get.toNamed(Routes.CHAT_MESSAGES);
                    },
                    leading: CircleAvatarWidget(
                      id: chat.recipient.profileImageId,
                      raduis: 25,
                    ),
                    title: Text(
                      '${chat.recipient.name}',
                      style: AppTextTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${chat.lastMessage?.content}',
                            style: AppTextTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text('${dateAgo(chat.lastMessage?.createdAt)}'),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () => controller.delete(chat.id!),
                      icon: Icon(
                        Bootstrap.trash,
                        size: 20,
                      ),
                    ),
                  );
                },
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
          )
        ],
      ),
    );
  }
}

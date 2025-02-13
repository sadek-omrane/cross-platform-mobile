import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/models/user_model.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/core/widgets/bottom_sheet_widget.dart';
import 'package:cross_platforme_mobile/app/core/widgets/circle_avatar_widget.dart';
import 'package:cross_platforme_mobile/app/modules/chats/controllers/chats_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class ChatFormWidget extends GetWidget<ChatsController> {
  const ChatFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      title: 'Create new chat',
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: controller.searchController,
              decoration: InputDecoration(
                labelText: 'Search for a user',
                prefixIcon: Icon(Bootstrap.search),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              ),
              onChanged: (value) => controller.search(),
            ),
            SizedBox(height: 10),
            FormField<UserModel>(
              initialValue: null,
              validator: (value) {
                if (value == null) {
                  return 'User is required';
                }
                return null;
              },
              builder: (state) {
                return Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.users.length,
                        itemBuilder: (context, index) {
                          final user = controller.users[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              controller.selectedUser.value = user;
                              state.didChange(user);
                            },
                            leading: CircleAvatarWidget(
                              id: user.profileImageId,
                              raduis: 25,
                            ),
                            title: Text('${user.name}'),
                            subtitle: Text('${user.email}'),
                            trailing: Obx(
                              () => controller.selectedUser.value?.id == user.id
                                  ? Icon(Bootstrap.check)
                                  : SizedBox.shrink(),
                            ),
                          );
                        },
                      ),
                      if (state.hasError)
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            state.errorText!,
                            style: AppTextTheme.bodySmall
                                .copyWith(color: AppColors.error),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            // message
            TextFormField(
              controller: controller.messageController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Type a message *',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Message is required' : null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.create,
              child: Text(
                'Create chat',
                style: AppTextTheme.bodyLarge.copyWith(
                  color: AppColors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: AppColors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

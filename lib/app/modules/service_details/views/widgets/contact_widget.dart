import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/core/widgets/bottom_sheet_widget.dart';
import 'package:cross_platforme_mobile/app/modules/service_details/controllers/service_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactWidget extends GetWidget<ServiceDetailsController> {
  ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      title: 'Create new chat',
      initialChildSize: .5,
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
              onPressed: controller.contact,
              child: Text(
                'Send',
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

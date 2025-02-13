import 'dart:io';

import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/config/constants.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';

class ImageInputWidget extends StatelessWidget {
  String hintText;
  double width;
  double height;
  String? initialValue;
  Rx<File?> controller;
  Color? borderColor;
  double borderRadius = 10;
  double? topLeftBorderRadius;
  double? topRightBorderRadius;
  double? bottomLeftBorderRadius;
  double? bottomRightBorderRadius;
  String? Function(String?)? validator;
  double? maxHeight;
  double? maxWidth;

  ImageInputWidget({
    super.key,
    required this.hintText,
    this.width = 120,
    this.height = 120,
    this.initialValue,
    required this.controller,
    this.borderRadius = 10,
    this.topLeftBorderRadius,
    this.topRightBorderRadius,
    this.bottomLeftBorderRadius,
    this.bottomRightBorderRadius,
    this.borderColor,
    this.validator,
    this.maxHeight,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: initialValue,
      validator: validator,
      builder: (state) {
        return Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  controller.value = await pickImageFromGallery(
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                  );
                  state.didChange(controller.value?.path);
                },
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              topLeftBorderRadius ?? borderRadius),
                          topRight: Radius.circular(
                              topRightBorderRadius ?? borderRadius),
                          bottomLeft: Radius.circular(
                              bottomLeftBorderRadius ?? borderRadius),
                          bottomRight: Radius.circular(
                              bottomRightBorderRadius ?? borderRadius),
                        ),
                        border: Border.all(
                          color: AppColors.white,
                          width: 2,
                        ),
                        color: AppColors.accent,
                        image: controller.value != null
                            ? DecorationImage(
                                image: AssetImage(controller.value!.path),
                                fit: BoxFit.cover,
                              )
                            : initialValue != null
                                ? DecorationImage(
                                    image: NetworkImage(
                                        '$EFILE_URL/${initialValue}.jpg'),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Bootstrap.camera_fill,
                            color: AppColors.accent2,
                            size: 30,
                          ),
                          Text(
                            hintText,
                            style: AppTextTheme.bodySmall
                                .copyWith(color: AppColors.accent4),
                          ),
                        ],
                      ),
                    ),
                    if (controller.value != null)
                      Positioned(
                        top: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () => controller.value = null,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withOpacity(.3),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.close, color: AppColors.black),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (state.hasError)
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    state.errorText!,
                    style:
                        AppTextTheme.bodySmall.copyWith(color: AppColors.error),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Future<File?> pickImageFromGallery(
      {double? maxWidth, double? maxHeight}) async {
    try {
      final ImagePicker picker = ImagePicker();
      // Pick an image.
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );
      if (image == null) return null;
      return File(image.path);
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == 'photo_access_denied') {
          ToastFactory.error('Permission denied');
        }
      } else
        ToastFactory.error('Failed to pick image');
    }
    return null;
  }
}

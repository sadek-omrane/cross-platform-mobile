import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // logo,
                      Image.asset(
                        'assets/images/app_logo.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 20),
                      // app name,
                      Text(
                        'LocalPro',
                        style: AppTextTheme.headlineXLarge.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      // description,
                      Text(
                        'Discover local services tailored just for you!',
                        style: AppTextTheme.bodyMedium.copyWith(
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.REGISTER),
                child: Text(
                  'Get Started',
                  style: AppTextTheme.bodyLarge.copyWith(
                    color: AppColors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

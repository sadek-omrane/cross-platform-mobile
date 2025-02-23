import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create a new account',
                  style: AppTextTheme.headlineXLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  'Join us to connect with local professionals easily',
                  style: AppTextTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20),
                //name
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: 'Name *',
                    suffixIcon: Icon(Bootstrap.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                //email
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email *',
                    suffixIcon: Icon(Bootstrap.envelope),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                //password
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password *',
                    suffixIcon: Icon(Bootstrap.key),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                //confirm password
                TextFormField(
                  controller: controller.confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password *',
                    suffixIcon: Icon(Bootstrap.key),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password is required';
                    }
                    if (value != controller.passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                //sign up button
                ElevatedButton(
                  onPressed: controller.register,
                  child: Text(
                    'Sign Up',
                    style: AppTextTheme.bodyLarge.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    backgroundColor: Color(0xFF0056B3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: AppTextTheme.bodyMedium.copyWith(
                      color: AppColors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: AppTextTheme.bodyMedium.copyWith(
                          color: AppColors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(Routes.LOGIN),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

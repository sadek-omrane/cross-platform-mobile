import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Settings',
              style: AppTextTheme.titleSmall,
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList.list(
              children: [
                ListTile(
                  leading: Icon(Bootstrap.translate),
                  title: Text('Language'),
                  trailing: Icon(Bootstrap.chevron_right),
                  onTap: () {
                    // Navigate to language settings
                  },
                ),
                ListTile(
                  leading: Icon(Bootstrap.bell),
                  title: Text('Notifications'),
                  trailing: Icon(Bootstrap.chevron_right),
                  onTap: () {
                    // Navigate to notification settings
                  },
                ),
                ListTile(
                  leading: Icon(Bootstrap.lock),
                  title: Text('Privacy'),
                  trailing: Icon(Bootstrap.chevron_right),
                  onTap: () {
                    // Navigate to privacy settings
                  },
                ),
                ListTile(
                  leading: Icon(Bootstrap.info),
                  title: Text('About'),
                  trailing: Icon(Bootstrap.chevron_right),
                  onTap: () {
                    // Navigate to about page
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.logout,
                  child: Text(
                    'Logout',
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
        ],
      ),
    );
  }
}

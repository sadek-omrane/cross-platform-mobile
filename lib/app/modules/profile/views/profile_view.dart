import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/core/widgets/circle_avatar_widget.dart';
import 'package:cross_platforme_mobile/app/core/widgets/service_card_widget.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Profile', style: AppTextTheme.titleSmall),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Bootstrap.gear),
                onPressed: () {},
              ),
              SizedBox(width: 10),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 20),
                  Obx(
                    () => Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatarWidget(
                              id: controller.me?.profileImageId,
                              raduis: 70,
                              brColor: Colors.white,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              child: IconButton(
                                onPressed: () => Get.toNamed(Routes.USER_FORM),
                                icon: Icon(
                                  Bootstrap.pencil_square,
                                  color: AppColors.blue,
                                ),
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      AppColors.accent.withOpacity(.6),
                                  shape: CircleBorder(
                                    side: BorderSide(
                                      color: AppColors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              right: 0,
                              bottom: 0,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${controller.me?.name}',
                          style: AppTextTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'My Services',
                    style: AppTextTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.SERVICE_FORM)?.then(
                        (value) {
                          if (value != null) controller.getServices();
                        },
                      ),
                      child: Text(
                        'Add Service',
                        style: AppTextTheme.bodySemiLarge.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // list of services
                  controller.obx(
                    (state) => ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state?.length,
                      itemBuilder: (context, index) {
                        final service = state?[index];
                        return SizedBox(
                          height: 200,
                          child: ServiceCardWidget(
                            showMenu: true,
                            service: service!,
                          ),
                        );
                      },
                    ),
                    onLoading:
                        Center(child: CircularProgressIndicator.adaptive()),
                    onEmpty: Column(
                      children: [
                        SizedBox(height: 10),
                        Icon(Bootstrap.database),
                        SizedBox(height: 10),
                        Text('No services found',
                            style: AppTextTheme.bodyMedium),
                      ],
                    ),
                    onError: (error) => Column(
                      children: [
                        SizedBox(height: 10),
                        Icon(Bootstrap.exclamation_circle),
                        SizedBox(height: 10),
                        Text(error.toString()),
                      ],
                    ),
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
          ),
        ],
      ),
    );
  }
}

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
                onPressed: () => Get.toNamed(Routes.SETTINGS),
              ),
              SizedBox(width: 10),
            ],
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Obx(
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
                              backgroundColor: AppColors.accent.withOpacity(.6),
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
                    if (controller.me?.bio?.isNotEmpty == true) ...[
                      SizedBox(height: 5),
                      Text(
                        '${controller.me?.bio}',
                        style: AppTextTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: TabBar(
              padding: EdgeInsets.symmetric(horizontal: 20),
              controller: controller.tabController,
              tabs: [
                Tab(
                  child: Text(
                    'My Services',
                    style: AppTextTheme.bodyLarge,
                  ),
                ),
                Tab(
                  child: Text(
                    'My Orders',
                    style: AppTextTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverFillRemaining(
            child: TabBarView(
              controller: controller.tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                controller.obx(
                  (state) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () =>
                                  Get.toNamed(Routes.SERVICE_FORM)?.then(
                                (value) {
                                  if (value != null) controller.get();
                                },
                              ),
                              icon: Icon(Bootstrap.plus_square),
                            ),
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state?.length,
                            itemBuilder: (context, index) {
                              final service = state?[index];
                              return SizedBox(
                                height: 240,
                                child: ServiceCardWidget(
                                  showMenu: true,
                                  service: service!,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  onLoading:
                      Center(child: CircularProgressIndicator.adaptive()),
                  onEmpty: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () =>
                                Get.toNamed(Routes.SERVICE_FORM)?.then(
                              (value) {
                                if (value != null) controller.get();
                              },
                            ),
                            icon: Icon(Bootstrap.plus_square),
                          ),
                        ),
                        SizedBox(height: 10),
                        Icon(Bootstrap.database),
                        SizedBox(height: 10),
                        Text(
                          'No services found',
                          style: AppTextTheme.bodyMedium,
                        ),
                      ],
                    ),
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
                controller.obx(
                  (state) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () =>
                                  Get.toNamed(Routes.SERVICE_FORM)?.then(
                                (value) {
                                  if (value != null) controller.get();
                                },
                              ),
                              icon: Icon(Bootstrap.plus_square),
                            ),
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state?.length,
                            itemBuilder: (context, index) {
                              final service = state?[index];
                              return SizedBox(
                                height: 240,
                                child: ServiceCardWidget(
                                  showMenu: true,
                                  service: service!,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  onLoading:
                      Center(child: CircularProgressIndicator.adaptive()),
                  onEmpty: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () =>
                                Get.toNamed(Routes.SERVICE_FORM)?.then(
                              (value) {
                                if (value != null) controller.get();
                              },
                            ),
                            icon: Icon(Bootstrap.plus_square),
                          ),
                        ),
                        SizedBox(height: 10),
                        Icon(Bootstrap.database),
                        SizedBox(height: 10),
                        Text(
                          'No services found',
                          style: AppTextTheme.bodyMedium,
                        ),
                      ],
                    ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* 
Row(
                      children: [
                        Text(
                          'My Services',
                          style: AppTextTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () => Get.toNamed(Routes.SERVICE_FORM)?.then(
                            (value) {
                              if (value != null) controller.get();
                            },
                          ),
                          icon: Icon(Bootstrap.plus_circle),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    controller.obx(
                      (state) => ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state?.length,
                        itemBuilder: (context, index) {
                          final service = state?[index];
                          return SizedBox(
                            height: 240,
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
                    /* SizedBox(height: 20),
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
                    ), */
*/

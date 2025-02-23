import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/core/widgets/circle_avatar_widget.dart';
import 'package:cross_platforme_mobile/app/core/widgets/service_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Home', style: AppTextTheme.titleSmall),
            centerTitle: true,
            actions: [
              IconButton(
                icon: CircleAvatarWidget(
                  id: controller.me?.profileImageId,
                  raduis: 22,
                ),
                onPressed: () {},
              ),
              SizedBox(width: 10),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: controller.searchController,
                    onChanged: (value) => controller.get(),
                    decoration: InputDecoration(
                      hintText: 'Search for services',
                      prefixIcon: Icon(Bootstrap.search),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 33,
                  child: Obx(
                    () => ListView.builder(
                      padding: EdgeInsets.only(left: 20),
                      itemCount: controller.sectors.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final sector = controller.sectors[index];
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Obx(
                            () => FilterChip(
                              label: Text(
                                '${sector.name}',
                                style: AppTextTheme.bodySmall.copyWith(
                                  color: controller.sectorId.value == sector.id
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                              checkmarkColor: AppColors.white,
                              selected: controller.sectorId.value == sector.id,
                              onSelected: (selected) {
                                if (selected) {
                                  controller.sectorId.value = sector.id;
                                } else {
                                  controller.sectorId.value = null;
                                }
                                controller.get();
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    'Services',
                    style: AppTextTheme.bodyLarge,
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
                ],
              ),
            ),
          ),
          /* SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return SizedBox(); //ServiceCardWidget(service: ,);
              },
            ),
          ), */
        ],
      ),
    );
  }
}

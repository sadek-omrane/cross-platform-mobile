import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
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
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        '${controller.me?.name}',
                        style: AppTextTheme.bodyMedium,
                      ),
                    ),
                    /* CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      backgroundColor: AppColors.accent2,
                    ) */
                  ],
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
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Chip(
                          label: Text('Category $index'),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverPadding(
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
          ),
        ],
      ),
    );
  }
}

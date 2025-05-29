import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/core/widgets/service_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Favorites',
              style: AppTextTheme.titleSmall,
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Padding(
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
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: controller.obx(
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
                onLoading: Center(child: CircularProgressIndicator.adaptive()),
                onEmpty: Column(
                  children: [
                    SizedBox(height: 10),
                    Icon(Bootstrap.database),
                    SizedBox(height: 10),
                    Text('No services found', style: AppTextTheme.bodyMedium),
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
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
        ],
      ),
    );
  }
}

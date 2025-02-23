import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/search_controller.dart' as searchController;

class SearchView extends GetView<searchController.SearchController> {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Recommanded',
              style: AppTextTheme.titleSmall,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Bootstrap.three_dots_vertical),
                onPressed: () {},
              ),
              SizedBox(width: 10),
            ],
          ),
          // search
        ],
      ),
    );
  }
}

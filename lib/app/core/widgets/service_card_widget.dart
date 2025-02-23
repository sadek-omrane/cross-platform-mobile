import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/models/service_model.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/core/widgets/image_widget.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class ServiceCardWidget extends StatelessWidget {
  ServiceModel service;
  bool showMenu = false;
  ServiceCardWidget({
    super.key,
    required this.service,
    this.showMenu = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(
            Routes.SERVICE_DETAILS,
            arguments: {'id': service.id},
          ),
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: ImageWidget(
                    id: service.serviceImageId,
                    borderRadius: 0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${service.name}',
                        style: AppTextTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      Text(
                        '${service.description}',
                        style: AppTextTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Bootstrap.star_half,
                            color: AppColors.amber,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Text('4.5 (205)', style: AppTextTheme.bodySmall),
                          Spacer(),
                          Text(
                            '\€${service.price}',
                            style: AppTextTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showMenu)
          Positioned(
            right: 10,
            top: 10,
            child: PopupMenuButton(
              icon: Icon(Bootstrap.three_dots_vertical),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Edit'),
                  value: 'edit',
                ),
                PopupMenuItem(
                  child: Text('Delete'),
                  value: 'delete',
                ),
              ],
            ),
          ),
      ],
    );
  }
}

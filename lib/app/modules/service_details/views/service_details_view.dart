import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:cross_platforme_mobile/app/core/utils/bottom_sheet_factory.dart';
import 'package:cross_platforme_mobile/app/core/widgets/circle_avatar_widget.dart';
import 'package:cross_platforme_mobile/app/core/widgets/image_widget.dart';
import 'package:cross_platforme_mobile/app/modules/service_details/views/widgets/contact_widget.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:readmore/readmore.dart';

import '../controllers/service_details_controller.dart';

class ServiceDetailsView extends GetView<ServiceDetailsController> {
  const ServiceDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('${state?.name}', style: AppTextTheme.titleSmall),
              expandedHeight: Get.height * 0.5,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: ImageWidget(
                  id: state?.serviceImageId,
                  borderRadius: 0,
                  fit: BoxFit.cover,
                ),
              ),
              actions: [
                PopupMenuButton(
                  icon: Icon(Bootstrap.three_dots_vertical),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () => Get.toNamed(
                        Routes.SERVICE_FORM,
                        arguments: {'id': state?.id},
                      )?.then(
                        (value) {
                          if (value != null) controller.get();
                        },
                      ),
                      child: Text('Edit'),
                      value: 'edit',
                    ),
                    PopupMenuItem(
                      onTap: controller.delete,
                      child: Text('Delete'),
                      value: 'delete',
                    ),
                  ],
                ),
                SizedBox(width: 10),
              ],
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        CircleAvatarWidget(
                          id: state?.createdBy?.profileImageId,
                          raduis: 25,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${state?.createdBy?.name}',
                                style: AppTextTheme.bodyMedium,
                              ),
                              Text(
                                '${state?.createdBy?.email}',
                                style: AppTextTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (state?.isFavorite == true) {
                              controller.unfavorite();
                            } else {
                              controller.favorite();
                            }
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.white,
                          ),
                          icon: Icon(
                            state?.isFavorite == true
                                ? Bootstrap.heart_fill
                                : Bootstrap.heart,
                            color: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ReadMoreText(
                      '${state?.description}',
                      trimMode: TrimMode.Line,
                      trimLines: 3,
                      colorClickableText: AppColors.blue,
                      trimCollapsedText: 'Voire plus',
                      trimExpandedText: 'Voire moins',
                      moreStyle: AppTextTheme.bodyMedium.copyWith(
                        color: AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 10),
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
                          '\€${state?.price}',
                          style: AppTextTheme.bodyMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        BottomSheetFactory.show(
                          context: context,
                          child: ContactWidget(),
                        );
                      },
                      child: Text(
                        'Contact',
                        style: AppTextTheme.bodySemiLarge.copyWith(
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
            )
          ],
        ),
        onLoading: Center(child: CircularProgressIndicator.adaptive()),
        onEmpty: Column(
          children: [
            SizedBox(height: 10),
            Icon(Bootstrap.database),
            SizedBox(height: 10),
            Text('No service found', style: AppTextTheme.bodyMedium),
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
    );
  }
}

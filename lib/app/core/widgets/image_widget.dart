import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ImageWidget extends StatelessWidget {
  int? id;
  double? width;
  double? height;
  double? borderRadius;
  BoxFit? fit;
  Color? brColor;

  ImageWidget({
    super.key,
    this.id,
    this.width,
    this.height,
    this.borderRadius,
    this.fit,
    this.brColor,
  });

  @override
  Widget build(BuildContext context) {
    // furure builder
    return Container(
      clipBehavior: Clip.antiAlias,
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.accent2,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        border: brColor != null
            ? Border.all(
                color: brColor!,
                width: 1.5,
              )
            : null,
      ),
      child: id != null && id! > 0
          ? Image.network(
              '$EFILE_URL/${id}',
              fit: fit,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(AppColors.accent8),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Bootstrap.info_circle,
                    color: AppColors.accent8,
                  ),
                );
              },
            )
          : Center(
              child: Icon(
                Bootstrap.info_circle,
                color: AppColors.accent8,
              ),
            ),
    );
  }
}

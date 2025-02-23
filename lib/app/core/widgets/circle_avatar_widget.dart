import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CircleAvatarWidget extends StatelessWidget {
  int? id;
  double? raduis;
  BoxFit? fit;
  Color? brColor;

  CircleAvatarWidget({
    super.key,
    this.id,
    this.raduis,
    this.fit,
    this.brColor,
  });

  @override
  Widget build(BuildContext context) {
    // furure builder
    return Container(
      clipBehavior: Clip.antiAlias,
      width: raduis != null ? 2 * raduis! : 100,
      height: raduis != null ? 2 * raduis! : 100,
      decoration: BoxDecoration(
        color: AppColors.accent2,
        borderRadius: BorderRadius.circular(raduis ?? 50),
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
              fit: fit ?? BoxFit.cover,
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

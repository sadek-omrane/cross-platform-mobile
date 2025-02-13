import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  String title;
  Widget child;
  BottomSheetWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7, // Initial size as a fraction of screen height
      minChildSize: 0.3, // Minimum size when collapsed
      maxChildSize: 0.9, // Maximum size when expanded
      expand: false, // Prevents full expansion to avoid covering entire screen
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.accent2,
                      width: 1,
                    ),
                  ),
                ),
                child: Text(
                  title,
                  style: AppTextTheme.bodyXLarge,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: child,
              ),
            ],
          ),
        );
      },
    );
  }
}

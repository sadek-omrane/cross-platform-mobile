import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetFactory {
  // show bottom sheet
  static void show({
    required BuildContext context,
    required Widget child,
    Bindings? binding,
    RouteSettings? settings,
  }) {
    if (binding != null) {
      binding.dependencies();
    }
    Get.bottomSheet(
      child,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      settings: settings,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
    );
  }

  // close bottom sheet
}

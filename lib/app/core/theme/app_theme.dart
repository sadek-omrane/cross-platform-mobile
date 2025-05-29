import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

ThemeData get appTheme {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.white,
      shadowColor: AppColors.accent,
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
      shape: Border(
        bottom: BorderSide(
          color: AppColors.accent2,
          width: .5,
        ),
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      padding: EdgeInsets.zero,
      height: 50,
      color: AppColors.white,
      elevation: 0,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.accent6,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.accent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      side: BorderSide(
        color: AppColors.accent2,
        width: 1,
      ),
      selectedColor: AppColors.blue,
      labelStyle: AppTextTheme.labelSmall,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.white,
      menuPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      backgroundColor: AppColors.transparent,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.accent4,
      elevation: 0,
    ),
    listTileTheme: ListTileThemeData(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.blue,
      selectionColor: AppColors.blue.withOpacity(0.5),
      selectionHandleColor: AppColors.blue,
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelAlignment: FloatingLabelAlignment.start,
      alignLabelWithHint: true,
      labelStyle: AppTextTheme.labelSmall,
      hintStyle: AppTextTheme.labelMedium.copyWith(
        color: AppColors.accent8,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      fillColor: AppColors.accent,
      filled: true,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.error,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.error,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorStyle: AppTextTheme.bodySmall.copyWith(
        color: AppColors.error,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppTextTheme.bodyMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 20,
        ),
      ),
    ),
    dividerTheme: DividerThemeData(
      thickness: 1,
      color: AppColors.accent2,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        //backgroundColor: AppColors.accent.withOpacity(0.2),
        //iconSize: 24,
        /* fixedSize: Size(40, 40),
        maximumSize: Size(45, 45),
        minimumSize: Size(25, 25), */
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.blue,
      unselectedLabelColor: AppColors.accent8,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: AppColors.blue,
      overlayColor: MaterialStateProperty.all(AppColors.transparent),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.white,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.transparent,
      shadowColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: AppColors.accent,
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
    ),
  );
}

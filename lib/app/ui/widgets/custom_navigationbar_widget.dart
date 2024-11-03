import 'package:bubilet_app/app/core/constants/colors.dart';
import 'package:bubilet_app/app/core/constants/icon_sizes.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: AppColor.primaryColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColor.whiteColor,
        selectedItemColor: AppColor.whiteColor,
        showSelectedLabels: false, // Seçili etiketleri gizler
        showUnselectedLabels: false, // Seçili olmayan etiketleri gizler
        iconSize: IconSizes.bottombarIconSize,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings_backup_restore_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.share_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: ""),
        ]);
  }
}

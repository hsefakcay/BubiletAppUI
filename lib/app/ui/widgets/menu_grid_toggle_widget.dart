import 'package:bubilet_app/app/core/constants/colors.dart';
import 'package:bubilet_app/app/core/constants/icon_sizes.dart';
import 'package:bubilet_app/app/core/utils/screen_utility.dart';
import 'package:flutter/material.dart';

class MenuGridToggle extends StatelessWidget {
  const MenuGridToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil.screenHeight(context);

    return Container(
      height: height * 0.06,
      decoration:
          BoxDecoration(color: AppColor.whiteColor, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: AppColor.primaryColor,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.grid_view_rounded,
                  size: IconSizes.iconMedium,
                  color: AppColor.lightGreyColor,
                )),
          ],
        ),
      ),
    );
  }
}

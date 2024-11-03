import 'package:bubilet_app/app/core/constants/colors.dart';
import 'package:bubilet_app/app/core/utils/screen_utility.dart';
import 'package:flutter/material.dart';

class FilterIconButton extends StatelessWidget {
  const FilterIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil.screenHeight(context);

    return Container(
      height: height * 0.06,
      decoration:
          BoxDecoration(color: AppColor.whiteColor, borderRadius: BorderRadius.circular(30)),
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.filter_alt_outlined,
            color: AppColor.darkGreyColor,
          )),
    );
  }
}

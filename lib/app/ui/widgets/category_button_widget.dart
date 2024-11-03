import 'package:bubilet_app/app/core/constants/colors.dart';
import 'package:bubilet_app/app/core/constants/icon_sizes.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const CategoryButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          elevation: 4, // Shadow depth
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        ),
        onPressed: () {},
        child: Row(children: [
          Icon(
            icon,
            size: IconSizes.iconMedium,
            color: AppColor.darkPrimaryColor,
          ),
          SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColor.darkPrimaryColor, fontWeight: FontWeight.bold),
          )
        ]));
  }
}

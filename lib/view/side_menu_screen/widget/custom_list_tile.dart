
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppingtask/core/const_data/app_fonts.dart';
import '../../../core/const_data/app_colors.dart';


class CustomListTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        color: AppColor.white,
      ),
      title: Row(
        children: [
          Text(
            title,
           style: const TextStyle(
             fontFamily: AppFonts.ralewayRegular,
             color: AppColor.white
           ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 16,color: AppColor.white),
            onPressed: onTap,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
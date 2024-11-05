import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/const_data/app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final TextStyle? titleStyle;
  final VoidCallback onMenuPressed;
  final VoidCallback? onBagPressed;
  final bool showNotificationDot;
  final String leadingIcon;
  final bool wrapLeadingInCircle;
  final double? leadingIconHeight;
  final double? leadingIconWidth;
  final String? highlightIcon;
  final String? bagIcon;

  const CustomAppBar({
    Key? key,
    required this.titleText,
    this.titleStyle,
    required this.onMenuPressed,
    this.onBagPressed,
    required this.leadingIcon,
    this.wrapLeadingInCircle = false,
    this.leadingIconHeight = 24.0,
    this.leadingIconWidth = 24.0,
    this.highlightIcon,
    this.bagIcon,
    this.showNotificationDot = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: GestureDetector(
          onTap: onMenuPressed,
          child: wrapLeadingInCircle
              ? Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              leadingIcon,
              height: leadingIconHeight,
              width: leadingIconWidth,
            ),
          )
              : SvgPicture.asset(
            leadingIcon,
            height: leadingIconHeight,
            width: leadingIconWidth,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Text(
                titleText,
                style: titleStyle ??
                    const TextStyle(
                      fontSize: 32,
                      fontFamily: AppFonts.ralewayBold,
                    ),
              ),
              if (highlightIcon != null)
                Positioned(
                  top: -12,
                  left: -20,
                  child: SvgPicture.asset(
                    highlightIcon!,
                    height: 25,
                    width: 25,
                  ),
                ),
            ],
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        if (bagIcon != null)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: onBagPressed,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      bagIcon!,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
                if (showNotificationDot)
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

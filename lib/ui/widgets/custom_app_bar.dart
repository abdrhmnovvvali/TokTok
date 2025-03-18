import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/constants/app_assets.dart';

import '../../utils/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppBar({

    super.key,
    this.backgroundColor,
    this.title,
    this.leadIcon = AppAssets.arrowLeft,
    this.onLeadingPressed,
  });

  final String? title;
  final String? leadIcon;
  final VoidCallback? onLeadingPressed;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        leading: leadIcon == null
            ? null
            : GestureDetector(
                onTap: onLeadingPressed,
                child: Center(
                  child: SvgPicture.asset(
                    leadIcon!,
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
        title: title == null ? null : Text(title!),
        titleTextStyle: const TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w700,
          fontSize: 26,
          height: 35 / 26,
          letterSpacing: -0.5,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

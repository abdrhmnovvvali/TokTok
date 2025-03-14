import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';

import '../../utils/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leadIcon = AppAssets.arrowLeft,
    this.onLeadingPressed,
  });

  final String? title;
  final String? leadIcon;
  final VoidCallback? onLeadingPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: AppBar(
        backgroundColor: Colors.transparent,

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
        titleTextStyle: TextStyle(
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
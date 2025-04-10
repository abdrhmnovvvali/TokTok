import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomePageAppBar({
    super.key,
    this.title,
    this.leadIcon,
    this.trailingIcons = const [],
    this.onLeadingPressed,
  });

  final String? title;
  final String? leadIcon;
  final List<Widget> trailingIcons;
  final VoidCallback? onLeadingPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: leadIcon == null ? 0 : 48,
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
        title: Row(
          children: [
            if (title != null)
              Row(
                children: [
                  Image.asset(
                    "assets/png/logo.png",
                    height: 32,
                    width: 32,
                  ),
                  16.horizontalSpace,
                  Text(
                    title!,
                    style: const TextStyle(
                      fontFamily: AppAssets.fontFamily,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
          ],
        ),
        actions: [
          InkWell(
              child: Image.asset(
            "assets/png/Heart.png",
            height: 32,
            width: 32,
          )),
          20.horizontalSpace,
          InkWell(
              child: Image.asset(
            "assets/png/chat.png",
            height: 32,
            width: 32,
          )),
        ],
        titleTextStyle: const TextStyle(
          fontFamily: AppAssets.fontFamily,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 26,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class CustomTextButton extends StatelessWidget {
   CustomTextButton({super.key, required this.text, required this.icon});
  String text;
  String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 380,
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            side: BorderSide(
                color: AppColors.borderColor,
                width: 1,
                style: BorderStyle.solid),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65.5),
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  text,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/constants/app_colors.dart';

class AccountTextButton extends StatelessWidget {
  AccountTextButton({super.key, required this.icon});
  String icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 88,
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            side: const BorderSide(
                color: AppColors.borderColor,
                width: 1,
                style: BorderStyle.solid),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 24,
                width: 24,
              ),
            ],
          )),
    );
  }
}

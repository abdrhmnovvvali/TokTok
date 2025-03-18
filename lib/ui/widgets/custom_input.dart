import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_colors.dart';

class CustomInput extends StatelessWidget {
  CustomInput(
      {super.key,
      required this.hint,
      required this.controller,
      this.obscureText = false,
      this.onChanged});
  String hint;
  TextEditingController controller = TextEditingController();
  bool obscureText = false;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 380,
      child: TextFormField(
        onChanged:onChanged ,
        
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: obscureText
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off,
                    color: AppColors.hintColor,
                  ),
                )
              : null,
          prefixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                obscureText ? AppAssets.password : AppAssets.email,
                colorFilter: const ColorFilter.mode(
                  AppColors.hintColor,
                  BlendMode.srcIn,
                ),
                height: 16,
                width: 16,
              )),
          hintText: hint,
          hintStyle: const TextStyle(
              color: AppColors.hintColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: AppAssets.fontFamily),
          fillColor: AppColors.inputColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

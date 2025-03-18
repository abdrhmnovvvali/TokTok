import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tok_tok/ui/pages/sign_up/widgets/account_text_button.dart';
import 'package:tok_tok/ui/widgets/custom_app_bar.dart';
import 'package:tok_tok/ui/widgets/custom_button.dart';
import 'package:tok_tok/ui/widgets/custom_check_box.dart';
import 'package:tok_tok/ui/widgets/custom_input.dart';
import 'package:tok_tok/ui/widgets/custom_text_button.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';
import 'package:tok_tok/utils/extensions/num_extension.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              77.h,
              const Text(
                "Create your\nAccount",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textColor,
                ),
              ),
              67.5.h,
              CustomInput(
                hint: 'Email',
                controller: TextEditingController(),
              ),
              20.h,
              CustomInput(   
                hint: 'Password',
                controller: TextEditingController(),
                obscureText: true,
              ),
              20.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCheckbox(
                    value: false,
                    onChanged: (value) {},
                    label: 'Remember me',
                  ),
                ],
              ),
              20.h,
              CustomButton(
                backgroundColor: AppColors.buttonColorDisable,
                text: "Sign up",
                color: Colors.white,
                onPressed: () {},
              ),
              20.h,
              Row(
                  children: [
                    const SizedBox(
                      height: 1,
                      width: 96,
                      child: ColoredBox(
                        color: AppColors.borderColor,
                      ),
                    ),
                    16.w,
                    const Text(
                      'or continue with',
                      style: TextStyle(
                        color: AppColors.cloakGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    16.w,
                    const SizedBox(
                      height: 1,
                      width: 96,
                      child: ColoredBox(
                        color: AppColors.borderColor,
                      ),
                    ),
                  ],
                ),
              30.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AccountTextButton(icon: AppAssets.facebook),
                  20.w,
                  AccountTextButton(icon: AppAssets.google),
                  20.w,
                  AccountTextButton(icon: AppAssets.apple),
                  
                ],
              ),
              55.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppAssets.fontFamily,
                    ),
                  ),
                  8.w,
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}

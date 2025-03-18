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

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
              63.h,
              const Text(
                "Login to your\nAccount",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textColor,
                ),
              ),
              53.h,
              CustomInput(
                hint: 'Email',
                controller: TextEditingController(),
              ),
              16.h,
              CustomInput(
                hint: 'Password',
                controller: TextEditingController(),
                obscureText: true,
              ),
              16.h,
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
              16.h,
              CustomButton(
                backgroundColor: AppColors.buttonColorDisable,
                text: "Sign up",
                color: Colors.white,
                onPressed: () {},
              ),
              16.h,
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot the password?",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
              ),
              30.h,
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
              24.h,
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
              35.h,
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
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Sign up',
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

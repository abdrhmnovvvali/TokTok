import 'package:flutter/material.dart';
import 'package:tok_tok/ui/widgets/custom_app_bar.dart';
import 'package:tok_tok/ui/widgets/custom_button.dart';
import 'package:tok_tok/ui/widgets/custom_text_button.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';
import 'package:tok_tok/utils/extensions/num_extension.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            35.h,
            const Image(
              image: AssetImage(AppAssets.welcome),
            ),
            35.h,
            const Text(
              'Let’s you in',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 40,
                fontFamily: AppAssets.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            39.h,
            CustomTextButton(
              height: 60,
              width: 380,
              text: 'Continue with Facebook',
              icon: AppAssets.facebook,
            ),
            16.h,
            CustomTextButton(
              height: 60,
              width: 380,
              text: 'Continue with Google',
              icon: AppAssets.google,
            ),
            16.h,
            CustomTextButton(
              height: 60,
              width: 380,
              text: 'Continue with Apple',
              icon: AppAssets.apple,
            ),
            35.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const SizedBox(
                    height: 1,
                    width: 155,
                    child: ColoredBox(
                      color: AppColors.borderColor,
                    ),
                  ),
                  16.w,
                  const Text(
                    'or',
                    style: TextStyle(
                      color: AppColors.cloakGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  16.w,
                  const SizedBox(
                    height: 1,
                    width: 155,
                    child: ColoredBox(
                      color: AppColors.borderColor,
                    ),
                  ),
                ],
              ),
            ),
            35.h,
            CustomButton(
              onPressed: () {},
              backgroundColor: AppColors.primary,
              text: "Sign in with password",
              color: Colors.white,
            ),
            35.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have an account?',
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
    );
  }
}

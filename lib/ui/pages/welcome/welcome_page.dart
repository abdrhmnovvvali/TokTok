import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_button.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/extensions/num_extension.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            35.verticalSpace,
            const Image(
              image: AssetImage(AppAssets.welcome),
            ),
            35.verticalSpace,
            const Text(
              'Let’s you in',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 40,
                fontFamily: AppAssets.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            39.verticalSpace,
            CustomTextButton(
              height: 60,
              width: 380,
              text: 'Continue with Facebook',
              icon: AppAssets.facebook,
            ),
            16.verticalSpace,
            CustomTextButton(
              height: 60,
              width: 380,
              text: 'Continue with Google',
              icon: AppAssets.google,
            ),
            16.verticalSpace,
            CustomTextButton(
              height: 60,
              width: 380,
              text: 'Continue with Apple',
              icon: AppAssets.apple,
            ),
            35.verticalSpace,
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
                  16.verticalSpace,
                  const Text(
                    'or',
                    style: TextStyle(
                      color: AppColors.cloakGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  16.verticalSpace,
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
            35.verticalSpace,
            CustomButton(
              onPressed: () {},
              backgroundColor: AppColors.primary,
              text: "Sign in with password",
              color: Colors.white,
            ),
            35.verticalSpace,
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
                8.verticalSpace,
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

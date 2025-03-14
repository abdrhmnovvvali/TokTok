import 'package:flutter/material.dart';
import 'package:tok_tok/ui/widgets/custom_app_bar.dart';
import 'package:tok_tok/ui/widgets/custom_button.dart';
import 'package:tok_tok/ui/widgets/custom_text_button.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 39.5,
            ),
            Image(
              image: AssetImage(AppAssets.welcome),
            ),
            SizedBox(
              height: 39.5,
            ),
            Text(
              'Let’s you in',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 40,
                fontFamily: AppAssets.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 39.5,
            ),
            CustomTextButton(
              text: 'Continue with Facebook',
              icon: AppAssets.facebook,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextButton(
              text: 'Continue with Google',
              icon: AppAssets.google,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextButton(
              text: 'Continue with Apple',
              icon: AppAssets.apple,
            ),
            SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 1,
                    width: 155,
                    child: ColoredBox(
                      color: AppColors.borderColor,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'or',
                    style: TextStyle(
                      color: AppColors.cloakGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    height: 1,
                    width: 155,
                    child: ColoredBox(
                      color: AppColors.borderColor,
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(
                    height: 34,
                  ),

            CustomButton(
                onPressed: () {},
                backgroundColor: AppColors.primary,
                text: "Sign in with password",
                color: Colors.white)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../sign_up/widgets/account_text_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_text_button.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/extensions/num_extension.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  CustomAppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              55.verticalSpace,
              const Text(
                "Login to your\nAccount",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textColor,
                ),
              ),
              50.verticalSpace,
              CustomInput(
                hint: 'Email',
                controller: TextEditingController(),
              ),
              16.verticalSpace,
              CustomInput(
                hint: 'Password',
                controller: TextEditingController(),
                obscureText: true,
              ),
              20.verticalSpace,
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
              20.verticalSpace,
              CustomButton(
                backgroundColor: AppColors.buttonColorDisable,
                text: "Sign up",
                color: Colors.white,
                onPressed: () {},
              ),
              20.verticalSpace,
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
              45.verticalSpace,
              Row(
                children: [
                  const SizedBox(
                    height: 1,
                    width: 96,
                    child: ColoredBox(
                      color: AppColors.borderColor,
                    ),
                  ),
                  16.horizontalSpace,
                  const Text(
                    'or continue with',
                    style: TextStyle(
                      color: AppColors.cloakGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  16.horizontalSpace,
                  const SizedBox(
                    height: 1,
                    width: 96,
                    child: ColoredBox(
                      color: AppColors.borderColor,
                    ),
                  ),
                ],
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AccountTextButton(icon: AppAssets.facebook),
                  20.horizontalSpace,
                  AccountTextButton(icon: AppAssets.google),
                  20.horizontalSpace,
                  AccountTextButton(icon: AppAssets.apple),
                ],
              ),
              40.verticalSpace,
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
                  8.horizontalSpace,
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

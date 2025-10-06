import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tok_tok/cubits/signup/signup_cubit.dart';
import 'package:tok_tok/utils/constants/snackbars.dart';
import 'package:tok_tok/utils/helpers/go.dart';
import 'package:tok_tok/utils/helpers/pager.dart';
import 'widgets/account_text_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_input.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit =context.read<SignUpCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
      ),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (_, state) {
          if (state is SignUpSuccess) {
            Go.replace(context, Pager.signin);
          } else if (state is SignUpError) {
            Snackbars.showError(context);
          } else if (state is SignUpNetworkError) {
            Snackbars.showNetworkError(context);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  const Text(
                    "Create your\nAccount",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textColor,
                    ),
                  ),
                  30.verticalSpace,
                   CustomInput(
                    hint: 'Username',
                    controller: cubit.usernameController,
                  ),
                  5.verticalSpace,
                  CustomInput(
                    hint: 'Email',
                    controller: cubit.emailController,
                  ),
                  5.verticalSpace,
                   CustomInput(
                    hint: 'Phone Number',
                    controller: cubit.phoneController,
                  ),
                  5.verticalSpace,
                   CustomInput(
                    hint: 'Full Name',
                    controller: cubit.fullNameController,
                  ),
                  5.verticalSpace,
                  CustomInput(
                    hint: 'Password',
                    controller:cubit.passwordController,
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
                    onPressed: () {
                      cubit.handleSignUp(context);
                    },
                  ),
                  20.verticalSpace,
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
                  20.verticalSpace,
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
                  20.verticalSpace,
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
                      GestureDetector(
                        onTap: () {
                          Go.replace(context,Pager.signin);
                        },
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
        ),
      ),
    );
  }
}

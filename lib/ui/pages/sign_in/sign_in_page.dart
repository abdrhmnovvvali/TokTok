import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/cubits/signin/signin_cubit.dart';
import 'package:tok_tok/utils/constants/snackbars.dart';
import 'package:tok_tok/utils/helpers/go.dart';
import 'package:tok_tok/utils/helpers/pager.dart';
import '../sign_up/widgets/account_text_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_input.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: signInCubit.formKey,
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
                  controller: signInCubit.usernameController,
                ),
                16.verticalSpace,
                CustomInput(
                  hint: 'Password',
                  controller: signInCubit.passwordController,
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
                BlocConsumer<SignInCubit, SignInState>(
                  listener: (_, state) {
                    if (state is SignInSuccess) {
                      Go.replace(context, Pager.profile);
                    } else if (state is SignInError) {
                      Snackbars.showError(context);
                    } else if (state is SignInNetworkError) {
                      Snackbars.showNetworkError(context);
                    }
                  },
                  builder: (_, state) => CustomButton(
                    color: Colors.white,
                    backgroundColor: AppColors.primary,
                    onPressed: () {
                      log("duymeye basildi");
                      signInCubit.handleSignIn();
                    },
                    text: 'Login',
                  ),
                ),
                20.verticalSpace,
                Center(
                  child: TextButton(
                      onPressed: () {
                      Go.replace(context, Pager.forget);
                      },
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
                    AccountTextButton(icon: AppAssets.facebook,),
                    20.horizontalSpace,
                    AccountTextButton(icon: AppAssets.google,onPressed: (){
                    },),
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
      ),
    );
  }
}

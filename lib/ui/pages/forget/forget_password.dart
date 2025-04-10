import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tok_tok/cubits/forget/forget_cubit.dart';
import 'package:tok_tok/ui/widgets/custom_app_bar.dart';
import 'package:tok_tok/ui/widgets/custom_button.dart';
import 'package:tok_tok/ui/widgets/custom_input.dart';
import 'package:tok_tok/ui/widgets/custom_text_button.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';
import 'package:tok_tok/utils/constants/snackbars.dart';
import 'package:tok_tok/utils/helpers/go.dart';
import 'package:tok_tok/utils/helpers/pager.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetCubit>();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Forget Password',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                50.verticalSpace,
                Center(
                  child: Image.asset('assets/png/forgot.png'),
                ),
                50.verticalSpace,
                Text(
                  textAlign: TextAlign.left,
                  "Select which contact details should we use to reset your password",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                  ),
                ),
                40.verticalSpace,
                CustomInput(
                  hint: "Email",
                  controller: cubit.emailController,
                ),
                90.verticalSpace,
                BlocConsumer<ForgetCubit, ForgetState>(
                  listener: (_, state) {
                    if (state is ForgetPasswordSuccess) {
                      Go.replace(context, Pager.verify);
                    } else if (state is ForgetPasswordFailure) {
                      Snackbars.serverError(context);
                    } else if (state is ForgetPasswordFailure) {
                      Snackbars.showError(context);
                    } else if (state is ForgetPasswordNetworkError) {
                      Snackbars.showNetworkError(context);
                    }
                  },
                  builder: (_, state) => CustomButton(
                    color: Colors.white,
                    backgroundColor: AppColors.primary,
                    onPressed: () {
                      log("duymeye basildi");
                      cubit.handleForget();
                    },
                    text: 'Contiune',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

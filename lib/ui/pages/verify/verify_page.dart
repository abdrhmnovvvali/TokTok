import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/cubits/forget/forget_cubit.dart';
import 'package:tok_tok/cubits/verify/verify_cubit.dart';
import 'package:tok_tok/ui/pages/verify/custom_verify_text_form_field.dart';
import 'package:tok_tok/ui/widgets/custom_app_bar.dart';
import 'package:tok_tok/ui/widgets/custom_button.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';
import 'package:tok_tok/utils/constants/snackbars.dart';
import 'package:tok_tok/utils/helpers/go.dart';
import 'package:tok_tok/utils/helpers/pager.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyCubit>();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Forget Password',
      ),
      body: Column(
        children: [
          240.verticalSpace,
          const Center(child: Text("Send code")),
          CustomVerifyTextFormField(),
          240.verticalSpace,
          BlocConsumer<VerifyCubit, VerifyState>(
            listener: (_, state) {
              if (state is ForgetPasswordSuccess) {
                Go.replace(context, Pager.signin);
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
                cubit.handleVerify();
              },
              text: 'Verify',
            ),
          ),
        ],
      ),
    );
  }
}

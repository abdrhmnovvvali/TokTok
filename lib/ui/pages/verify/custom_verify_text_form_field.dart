import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/cubits/verify/verify_cubit.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';

import '../../../../utils/constants/app_colors.dart';

class CustomVerifyTextFormField extends StatelessWidget {
  CustomVerifyTextFormField({super.key});


  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  Widget build(BuildContext context) {
    final cubit =context.read<VerifyCubit>();
    return Form(
      key: cubit.formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (i) {
          return SizedBox(
            width: 78.r,
            height: 61.r,
            child: TextFormField(
              controller: cubit.verifyController[i],
              focusNode: _focusNodes[i],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              onChanged: (value) {
                if (value.isNotEmpty && i < 3) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && i > 0) {
                  FocusScope.of(context).previousFocus();
                }
              },
              decoration: InputDecoration(
                counterStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.borderColor,
                  fontFamily: AppAssets.fontFamily,
                  fontSize: 26,
                  height: 26.h / 26.sp,
                ),
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

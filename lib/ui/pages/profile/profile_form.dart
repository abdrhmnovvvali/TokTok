import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/cubits/profile/profile_cubit.dart';
import 'package:tok_tok/ui/widgets/custom_button.dart';

import 'package:tok_tok/ui/widgets/profile_inputs.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(children: [
          const CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage("assets/png/splash.png"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
                onTap: () {}, child: Image.asset("assets/png/update.png")),
          )
        ]),
        24.verticalSpace,
        ProfileInputs(
          controller: cubit.firstnameController,
          title: 'Full Name',
        ),
        24.verticalSpace,
        ProfileInputs(
          title: "Username",
          controller: cubit.usernameController,
        ),
        24.verticalSpace,
        ProfileInputs.date(
          title: 'Date of Birth',
          controller: cubit.datebirthController,
        ),
        24.verticalSpace,
        ProfileInputs(
          title: "Phone Number",
          controller: cubit.phoneController,
        ),
        24.verticalSpace,
        ProfileInputs(
          title: "Occupation",
          controller: cubit.occoptionController,
        ),
        63.verticalSpace,
        CustomButton(
          backgroundColor: AppColors.primary,
          text: "Continue",
          onPressed: () {
            cubit.getUser();
          },
          color: Colors.white,
        )
      ],
    );
  }
}

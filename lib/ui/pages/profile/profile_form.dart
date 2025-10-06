import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/cubits/profile/profile_cubit.dart';
import 'package:tok_tok/ui/pages/home_page/home_page.dart';
import 'package:tok_tok/ui/widgets/custom_button.dart';

import 'package:tok_tok/ui/widgets/profile_inputs.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';
import 'package:tok_tok/utils/constants/snackbars.dart';
import 'package:tok_tok/utils/helpers/go.dart';
import 'package:tok_tok/utils/helpers/pager.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: cubit.selectedImage != null
                ? FileImage(cubit.selectedImage!)
                : const AssetImage("assets/png/splash.png") as ImageProvider,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
                onTap: () {
                  cubit.pickImageFromGallery();
                },
                child: Image.asset("assets/png/update.png")),
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
        BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileError) {
              Snackbars.showError(context);
            } else if (state is ProfileUpdated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                CustomButton(
                  backgroundColor: AppColors.primary,
                  text: state is ProfileLoading ? "Loading..." : "Continue",
                  onPressed: () {
                    context.read<ProfileCubit>().updateUserProfile();
                  },
                  color: Colors.white,
                ),
                16.verticalSpace,
                CustomButton(
                  backgroundColor: Colors.grey.shade400,
                  text: "Keç",
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Pager.home),
                    );
                  },
                  color: Colors.black,
                ),
              ],
            );
          },
        )
      ],
    );
  }
}

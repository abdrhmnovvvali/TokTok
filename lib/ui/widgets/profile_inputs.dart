import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';

import '../../utils/constants/app_colors.dart';
import 'package:tok_tok/utils/extensions/date_time_extensions.dart';

class ProfileInputs extends StatefulWidget {
  const ProfileInputs({
    super.key,
    required this.title,
    this.controller,
    this.isObsecure = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.showPasswordConditions = false,
    this.isPassword = false,
    this.maxLines = 1,
  }) : isDate = false;

  const ProfileInputs.date({
    super.key,
    required this.title,
    this.controller,
    this.isObsecure = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.showPasswordConditions = false,
    this.isPassword = false,
    this.maxLines,
  }) : isDate = true;

  final int? maxLines;
  final String? title;
  final TextEditingController? controller;
  final bool isObsecure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool showPasswordConditions;
  final bool isPassword;
  final bool isDate;

  @override
  State<ProfileInputs> createState() => _ProfileInputsState();
}

class _ProfileInputsState extends State<ProfileInputs> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.verticalSpace,
        TextFormField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          obscureText: widget.isObsecure,
          obscuringCharacter: '⬤',
          keyboardType: widget.keyboardType,
          onTap: widget.isDate ? () => _selectDate(context) : null,
          readOnly: widget.isDate,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.inputTextColor,
            fontWeight: FontWeight.w400,
            fontFamily: AppAssets.fontFamily,
            height: 22.h / 14.sp,
            letterSpacing: widget.isObsecure ? 10 : -0.5,
          ),
          validator: widget.validator,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.title,
            hintStyle: TextStyle(
                color: AppColors.hintColor,
                fontWeight: FontWeight.w400,
                fontFamily: AppAssets.fontFamily,
                fontSize: 14.sp),
            fillColor: AppColors.inputColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.isDate
                ? IconButton(
                    onPressed: () => _selectDate(context),
                    icon: const Icon(Icons.date_range),
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller?.text = selectedDate.formatDate;
      });
    }
  }
}

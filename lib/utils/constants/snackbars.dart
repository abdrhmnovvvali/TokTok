import 'package:flutter/material.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class Snackbars {
  Snackbars._();

  static void _showSnackBar(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Duration? duration,
  }) {
    final uniqueKey = UniqueKey();
    
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          key: uniqueKey, 
          content: Text(message),
          backgroundColor: backgroundColor,
          duration: duration ?? const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating, 
        ),
      );
  }

  static void showError(
    BuildContext context, {
    String message = 'Error Occurred',
  }) =>
      _showSnackBar(
        context,
        message: message,
        backgroundColor: Colors.red,
      );

  static void serverError(
    BuildContext context, {
    String message = "Too many requests. Please try again later."
} )=>
      _showSnackBar(
        context,
        message: message,
        backgroundColor: Colors.red,
      );    

  static void showSuccess(
    BuildContext context, {
    String message = 'Successful!',
  }) =>
      _showSnackBar(
        context,
        message: message,
        backgroundColor: AppColors.primary,
      );

  static void showNetworkError(
    BuildContext context, {
    String message = 'Network Error Occurred',
  }) =>
      _showSnackBar(
        context,
        message: message,
        backgroundColor: Colors.red,
      );

  static void showWarning(
    BuildContext context, {
    String message = 'Warning',
  }) =>
      _showSnackBar(
        context,
        message: message,
        backgroundColor: Colors.orange,
      );
}
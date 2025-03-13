import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,required this.backgroundColor,required this.text});

Color backgroundColor;
String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}

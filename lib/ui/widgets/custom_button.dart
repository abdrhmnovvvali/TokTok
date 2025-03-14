import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,required this.backgroundColor,required this.text,this.onPressed,required this.color});

Color backgroundColor;
String text;
void Function()? onPressed;
Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 380,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: onPressed,
        child: Text(text,style: TextStyle(color:color ),),
      ),
    );
  }
}

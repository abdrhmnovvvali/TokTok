import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          child: Image.asset("assets/png/logo.png"),
          radius: 40,

        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset("assets/png/addstory.png"),)
      ],

    );
  }
}
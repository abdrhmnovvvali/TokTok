import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final IconData icon;
  
  const AppBarButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: Colors.black,
        size: 20,
      ),
    );
  }
}
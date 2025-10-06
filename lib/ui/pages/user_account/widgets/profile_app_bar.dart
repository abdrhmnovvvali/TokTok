import 'package:flutter/material.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/app_bar_button.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/png/splash.png"),
          ),
          SizedBox(width: 8),
          Text(
            'john_doe',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
            size: 20,
          ),
          Spacer(),
          AppBarButton(icon: Icons.add),
          SizedBox(width: 12),
          AppBarButton(icon: Icons.menu),
        ],
      ),
    );
  }
}
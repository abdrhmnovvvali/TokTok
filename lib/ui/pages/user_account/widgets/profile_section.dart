import 'package:flutter/material.dart';
import 'package:tok_tok/ui/pages/user_account/user_account_page.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/profile_avatar.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/profile_description.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileAvatar(),
        const SizedBox(height: 16),
        const Text(
          'John Doe',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'UI/UX Designer',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12),
        const ProfileDescription(),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'www.yourdomain.com',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

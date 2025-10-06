import 'package:flutter/material.dart';
import 'package:tok_tok/ui/pages/user_account/user_account_page.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/statatik_item.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatItem(number: '356', label: 'Posts'),
        StatItem(number: '46,379', label: 'Followers'),
        StatItem(number: '318', label: 'Following'),
      ],
    );
  }
}
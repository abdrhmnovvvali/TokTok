import 'package:flutter/material.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/post_grid.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/profile_app_bar.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/profile_section.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/stats_section.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/stories_section.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/tab_section.dart';

class UserAccountPage extends StatelessWidget {
  const UserAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ProfileAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ProfileSection(),
                    SizedBox(height: 24),
                    StatsSection(),
                    SizedBox(height: 32),
                    StoriesSection(),
                    SizedBox(height: 24),
                    TabSection(),
                    SizedBox(height: 16),
                    PostsGrid(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



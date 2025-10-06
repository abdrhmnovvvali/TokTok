import 'package:flutter/material.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/tab_button.dart';

class TabSection extends StatefulWidget {
  const TabSection({Key? key}) : super(key: key);

  @override
  State<TabSection> createState() => _TabSectionState();
}

class _TabSectionState extends State<TabSection> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TabButton(
          icon: Icons.grid_on,
          isSelected: selectedTab == 0,
          onTap: () => setState(() => selectedTab = 0),
        ),
        TabButton(
          icon: Icons.video_library,
          isSelected: selectedTab == 1,
          onTap: () => setState(() => selectedTab = 1),
        ),
        TabButton(
          icon: Icons.person_pin,
          isSelected: selectedTab == 2,
          onTap: () => setState(() => selectedTab = 2),
        ),
      ],
    );
  }
}


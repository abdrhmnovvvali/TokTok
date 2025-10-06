import 'package:flutter/material.dart';
import 'package:tok_tok/ui/pages/user_account/user_account_page.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/storires_item.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          StoryItem(
            title: 'Add',
            color: Colors.pink,
            icon: Icons.add,
            isAddButton: true,
          ),
          StoryItem(
            title: 'Hangout',
            imageUrl: 'https://via.placeholder.com/60x60/FF5722/FFFFFF?text=H',
          ),
          StoryItem(
            title: 'Night',
            imageUrl: 'https://via.placeholder.com/60x60/9C27B0/FFFFFF?text=N',
          ),
          StoryItem(
            title: 'Friends',
            imageUrl: 'https://via.placeholder.com/60x60/607D8B/FFFFFF?text=F',
          ),
          StoryItem(
            title: 'Nature',
            imageUrl: 'https://via.placeholder.com/60x60/4CAF50/FFFFFF?text=Na',
          ),
        ],
      ),
    );
  }
}
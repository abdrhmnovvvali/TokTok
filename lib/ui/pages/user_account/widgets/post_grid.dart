import 'package:flutter/material.dart';
import 'package:tok_tok/ui/pages/user_account/user_account_page.dart';
import 'package:tok_tok/ui/pages/user_account/widgets/post_grid_item.dart';

class PostsGrid extends StatelessWidget {
  const PostsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 1),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return PostGridItem(index: index);
      },
    );
  }
}
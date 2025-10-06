import 'package:flutter/material.dart';

class PostGridItem extends StatelessWidget {
  final int index;
  
  const PostGridItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> colors = [
      'https://via.placeholder.com/150x150/E91E63/FFFFFF?text=${index + 1}',
      'https://via.placeholder.com/150x150/9C27B0/FFFFFF?text=${index + 1}',
      'https://via.placeholder.com/150x150/2196F3/FFFFFF?text=${index + 1}',
      'https://via.placeholder.com/150x150/4CAF50/FFFFFF?text=${index + 1}',
      'https://via.placeholder.com/150x150/FF9800/FFFFFF?text=${index + 1}',
      'https://via.placeholder.com/150x150/F44336/FFFFFF?text=${index + 1}',
      'https://via.placeholder.com/150x150/607D8B/FFFFFF?text=${index + 1}',
      'https://via.placeholder.com/150x150/795548/FFFFFF?text=${index + 1}',
      'https://via.placeholder.com/150x150/009688/FFFFFF?text=${index + 1}',
    ];
    
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(colors[index % colors.length]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
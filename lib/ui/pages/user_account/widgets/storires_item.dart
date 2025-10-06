import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final Color? color;
  final IconData? icon;
  final bool isAddButton;
  
  const StoryItem({
    Key? key,
    required this.title,
    this.imageUrl,
    this.color,
    this.icon,
    this.isAddButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isAddButton ? (color ?? Colors.pink) : Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
              image: imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: isAddButton
                ? Icon(
                    icon ?? Icons.add,
                    color: Colors.white,
                    size: 24,
                  )
                : null,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
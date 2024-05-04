import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final String Paris_Cat;
  final bool selected;
  final VoidCallback onTap;

  Categories({
    required this.Paris_Cat,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          Paris_Cat,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: selected
                ? Colors.deepPurple // Selected text color
                : Theme.of(context).brightness == Brightness.light
                    ? Colors.black // Light mode text color
                    : Colors.white, // Dark mode text color
          ),
        ),
      ),
    );
  }
}

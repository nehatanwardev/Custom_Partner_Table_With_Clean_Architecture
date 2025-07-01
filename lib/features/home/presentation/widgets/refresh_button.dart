import 'package:flutter/material.dart';

class CustomRefreshButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
  final Color? backgroundColor;
  const CustomRefreshButton({
    super.key,
    required this.onTap,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: backgroundColor ?? Colors.grey,
        child: Icon(Icons.refresh, color: color ?? Colors.black),
      ),
    );
  }
}

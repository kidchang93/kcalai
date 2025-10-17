import 'package:flutter/material.dart';

class ButtonModel {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final bool isExpanded;
  final IconData? icon;
  final Color? borderColor;

  const ButtonModel({
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.blueAccent,
    this.textColor = Colors.white,
    this.borderRadius = 12.0,
    this.isExpanded = true,
    this.icon,
    this.borderColor
  });
}
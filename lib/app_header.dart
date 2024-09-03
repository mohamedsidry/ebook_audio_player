import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final EdgeInsets padding;

  const TextHeader({
    super.key,
    required this.text,
    this.size = 24,
    this.color = Colors.black,
    this.padding = const EdgeInsets.all(0),
  });
  const TextHeader.h1({
    super.key,
    required this.text,
    this.size = 24,
    this.color = Colors.black,
    this.padding = const EdgeInsets.all(0),
  });
  const TextHeader.h2({
    super.key,
    required this.text,
    this.size = 18,
    this.color = Colors.black,
    this.padding = const EdgeInsets.all(0),
  });
  const TextHeader.h3({
    super.key,
    required this.text,
    this.size = 16,
    this.color = Colors.black,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

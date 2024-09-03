import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  static const Color defaultColor = Colors.black;
  static const double defaultIconSize = 32;
  static const double actionSepWidth = 10;

  final double iconSize;
  final Color iconColor;

  const CustomAppBar(
      {super.key,
      this.iconSize = defaultIconSize,
      this.iconColor = defaultColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageIcon(
            const AssetImage('assets/icons/menu_icon.png'),
            size: iconSize,
            color: iconColor,
          ),
          Expanded(
            child: _AppBarActions(
                size: iconSize,
                color: iconColor,
                sizedBoxWidth: actionSepWidth),
          ),
        ],
      ),
    );
  }
}

class _AppBarActions extends StatelessWidget {
  final Color color;
  final double size;
  final double sizedBoxWidth;

  const _AppBarActions(
      {super.key,
      required this.size,
      required this.color,
      this.sizedBoxWidth = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _ActionIcon(
          Icons.search,
          iconSize: size,
          iconColor: color,
        ),
        SizedBox(width: sizedBoxWidth),
        _ActionIcon(
          Icons.notifications,
          iconSize: size,
          iconColor: color,
        ),
        SizedBox(width: sizedBoxWidth),
        _ActionIcon(
          Icons.settings,
          iconSize: size,
          iconColor: color,
        ),
        //const Icon(Icons.search, size: 24),
      ],
    );
  }
}

class _ActionIcon extends Icon {
  static const double defualtSize = 24;
  static const Color defualtColor = Colors.black;
  final double iconSize;
  final Color iconColor;

  const _ActionIcon(super.icon,
      {this.iconSize = defualtSize, this.iconColor = defualtColor});
  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: iconSize, color: iconColor);
  }
}

import 'package:ebook_audio_player/config/ui/app_colors.dart';
import 'package:flutter/material.dart';

class NetImage extends StatelessWidget {
  final imageUrl;
  final double imageWidth, imageHight, boxBorderRadius;
  const NetImage(
      {super.key,
      required this.imageUrl,
      this.imageWidth = 100,
      this.imageHight = 100,
      this.boxBorderRadius = 8});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageWidth,
      height: imageHight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(boxBorderRadius),
        color: AppColors.black["std"],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}

import 'package:ebook_audio_player/app_header.dart';
import 'package:ebook_audio_player/image_slider.dart';
import 'package:flutter/material.dart';
import './config/ui/app_colors.dart';
import './app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgrounColors['light'] ?? Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgrounColors['light'] ?? Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                iconSize: 32,
                iconColor: AppColors.iconColors['dark'] ?? Colors.black,
              ),
              TextHeader(
                text: "Hello world !",
                size: 32,
                color: AppColors.maroon['std'] ?? Colors.black,
                padding: const EdgeInsets.only(left: 16),
              ),
              const SizedBox(width: double.infinity, height: 10),
              const ImageSlider(),
            ],
          ),
        ),
      ),
    );
  }
}

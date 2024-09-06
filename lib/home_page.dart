import 'package:ebook_audio_player/components/navigation_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:ebook_audio_player/app_header.dart';
import 'package:ebook_audio_player/components/popular_books.dart';
import './config/ui/app_colors.dart';
import './app_bar.dart';
import 'package:ebook_audio_player/config/config.dart';

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
                text: "Popular Books",
                size: 32,
                color: AppColors.maroon['std'] ?? Colors.black,
                padding: const EdgeInsets.only(left: 16),
              ),
              const PopularBooksSlider(
                imageLocation: SlideImageConfig.sourceOfImages,
              ),
              const NavigationScrollView(),
            ],
          ),
        ),
      ),
    );
  }
}

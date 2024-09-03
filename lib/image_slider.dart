import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageSlider extends StatelessWidget {
  static const List<String> images = [
    'assets/img/slide0.png',
    'assets/img/slide1.png',
    'assets/img/slide2.png',
    'assets/img/slide3.png',
    'assets/img/5.png',
    'assets/img/0.png',
  ];
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(children: <Widget>[
        Positioned(
          left: -20,
          top: 0,
          right: -20,
          bottom: 0,
          child: Container(
              padding: const EdgeInsets.all(0),
              height: 200,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.8),
                itemCount: images.length,
                itemBuilder: (context, index) => _Image(
                  imgPath: images[index],
                  current: index,
                  length: images.length,
                ),
              )),
        ),
      ]),
    );
  }
}

class _Image extends StatelessWidget {
  final String imgPath;
  final int length;
  final int current;

  const _Image(
      {super.key,
      required this.imgPath,
      required this.current,
      required this.length});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: current < length - 1
          ? const EdgeInsets.only(right: 16)
          : const EdgeInsets.only(right: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imgPath),
        ),
      ),
    );
  }
}

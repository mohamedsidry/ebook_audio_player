import 'dart:convert';
import 'package:ebook_audio_player/config/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopularBooksSlider extends StatelessWidget {
  final ImageLocations imageLocation;
  const PopularBooksSlider({super.key, required this.imageLocation});

  @override
  Widget build(BuildContext context) {
    return ImageSlider(imageLocation: imageLocation);
  }
}

class ImageSlider extends StatefulWidget {
  final ImageLocations imageLocation;

  const ImageSlider({super.key, required this.imageLocation});

  @override
  State<ImageSlider> createState() => _ImageSlideState();
}

class _ImageSlideState extends State<ImageSlider> {
  List<String> images = [];
  late ImageLocations location;

  @override
  void initState() {
    super.initState();
    location = widget.imageLocation;
    loadImages(location);
  }

  /// Loads images based on the selected location type (static, JSON, API).
  Future<void> loadImages(ImageLocations location) async {
    switch (location) {
      case ImageLocations.local:
        imagelist = SlideImageConfig.images;
        break;
      case ImageLocations.json:
        await getJsonData();
        break;
      case ImageLocations.api:
        await getAPIData();
        break;
      default:
        imagelist = SlideImageConfig.images;
    }
  }

  /// Loads image URLs from a JSON file.
  Future<List<String>> getJsonData() async {
    try {
      String rawJson = await DefaultAssetBundle.of(context)
          .loadString(SlideImageConfig.jsonLocation);
      List<dynamic> list = json.decode(rawJson);

      List<String> images = list.map((item) => item['img'].toString()).toList();
      imagelist = images;
      debugPrint('Image list loaded from JSON: ${images.length}');
      return imagelist;
    } catch (e) {
      debugPrint('Failed to load JSON data: $e');
      return [];
    }
  }

  /// Fetches image URLs from an API.
  Future<List<String>> getAPIData() async {
    try {
      final response = await http.get(Uri.parse(SlideImageConfig.endPoint));
      List<dynamic> list = json.decode(response.body);

      List<String> images = list.map((item) => item['url'].toString()).toList();
      imagelist = images;
      debugPrint('Image list loaded from API: ${images.length}');
      return imagelist;
    } catch (e) {
      debugPrint('Failed to load API data: $e');
      return [];
    }
  }

  // Setter and getter for images list
  set imagelist(List<String> imgs) {
    setState(() {
      images = imgs;
    });
  }

  List<String> get imagelist => images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SlideImageConfig.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -30,
            top: 0,
            right: -30,
            bottom: 0,
            child: SizedBox(
              height: SlideImageConfig.height,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.8),
                itemCount: images.length < SlideImageConfig.imageCount
                    ? images.length
                    : SlideImageConfig.imageCount,
                itemBuilder: (BuildContext context, int index) => _SingleImage(
                  location: location,
                  imageUrl: images[index],
                  current: index,
                  imageCount: images.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SingleImage extends StatelessWidget {
  final ImageLocations location;
  final String imageUrl;
  final int current;
  final int imageCount;

  const _SingleImage({
    super.key,
    required this.location,
    required this.imageUrl,
    required this.imageCount,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return location == ImageLocations.local ? _staticImage() : _networkImage();
  }

  Widget _staticImage() {
    return Container(
      height: SlideImageConfig.height,
      margin: current < imageCount - 1
          ? const EdgeInsets.only(right: 16)
          : const EdgeInsets.only(right: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }

  Widget _networkImage() {
    return Container(
      height: SlideImageConfig.height,
      margin: current < imageCount - 1
          ? const EdgeInsets.only(right: 16)
          : const EdgeInsets.only(right: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}

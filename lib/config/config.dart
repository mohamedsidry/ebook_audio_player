enum ImageLocations { local, json, api }

class SlideImageConfig {
  static const ImageLocations sourceOfImages = ImageLocations.local;
  static const String endPoint = 'https://jsonplaceholder.typicode.com/photos';
  static const String jsonLocation = 'json/popular_books.json';
  static const double height = 200;
  static const int imageCount = 10;
  static const List<String> images = [
    'assets/img/1.png',
    'assets/img/2.png',
    'assets/img/slide0.png',
    'assets/img/slide1.png',
    'assets/img/slide2.png',
    'assets/img/slide3.png',
    'assets/img/5.png',
    'assets/img/0.png',
  ];
}

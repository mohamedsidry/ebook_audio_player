class Book {
  late String title;
  late String text;
  late String imageUrl;
  late double rating;

  Book({
    this.title = _DefaultBook.defaultTitle,
    this.text = _DefaultBook.defaultText,
    this.imageUrl = _DefaultBook.defaultImageUrl,
    this.rating = _DefaultBook.defaultRating,
  });

  get bookTitle {
    return title;
  }

  set bookTitle(t) {
    text = t;
  }

  get bookText {
    return text;
  }

  set bookText(t) {
    text = t;
  }

  get bookImage {
    return imageUrl;
  }

  set bookImage(t) {
    imageUrl = t;
  }

  get bookRating {
    return rating;
  }

  set bookRating(t) {
    rating = t;
  }
}

abstract class _DefaultBook {
  static const String defaultTitle = "holy book";
  static const String defaultText =
      "The Quran, also romanized Qur'an or Koran, is the central religious text of Islam, believed by Muslims to be a revelation directly from God. It is organized in 114 chapters which consist of individual verses.";
  static const String defaultImageUrl =
      "https://images.pexels.com/photos/16733045/pexels-photo-16733045/free-photo-of-the-dome-of-the-rock-in-jerusalem.jpeg";
  static const double defaultRating = 4.8;
}

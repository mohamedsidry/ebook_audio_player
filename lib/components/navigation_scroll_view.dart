import 'dart:convert';
import 'package:ebook_audio_player/config/config.dart';
import 'package:ebook_audio_player/config/ui/app_colors.dart';
import 'package:ebook_audio_player/models/book.dart';
import 'package:ebook_audio_player/util/image_util.dart';
import 'package:flutter/material.dart';

class NavigationScrollView extends StatefulWidget {
  const NavigationScrollView({super.key});
  @override
  State<NavigationScrollView> createState() => _NavigationScrollViewState();
}

class _NavigationScrollViewState extends State<NavigationScrollView>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  List books = [];

  late List tabs = [
    {
      "title": "Popular",
      "color": AppColors.menuColors["color1"],
    },
    {
      "title": "New",
      "color": AppColors.menuColors["color2"],
    },
    {
      "title": "Tranding",
      "color": AppColors.menuColors["color3"],
    },
  ];
  @override
  initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  List<Widget> _tabsGenerator() {
    List<Widget> tabWidgets = [];
    for (var i = 0; i < tabs.length; i++) {
      tabWidgets = [
        ...tabWidgets,
        _SignleTab(
          index: i,
          title: tabs[i]['title'],
          color: tabs[i]['color'],
        )
      ];
    }
    return tabWidgets;
  }

  List<Widget> _tabViewsGenerator() {
    List<Widget> viewWidgets = [];

    return viewWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool isScrollable) => [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.backgrounColors['light'],
            surfaceTintColor: AppColors.backgrounColors['light'],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                color: AppColors.backgrounColors['light'],
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.center,
                  labelPadding: const EdgeInsets.all(5),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            offset: const Offset(0, 0))
                      ]),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: const EdgeInsets.all(5),
                  tabs: _tabsGenerator(),
                ),
              ),
            ),
          )
        ],
        body: TabBarView(
          controller: _tabController,
          //children: _tabViewsGenerator(),
          children: [
            _SignleTabView(
              backgoundColor:
                  AppColors.backgrounColors["light"] ?? Colors.white,
            ),
            _SignleTabView(
              backgoundColor:
                  AppColors.backgrounColors["light"] ?? Colors.white,
            ),
            _SignleTabView(
              backgoundColor:
                  AppColors.backgrounColors["light"] ?? Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class _SignleTab extends StatelessWidget {
  static const String defaultTitle = "Tab";
  static const Color defaultColor = Color(0xFF04abe6);
  final String title;
  final Color color;
  final int index;

  const _SignleTab(
      {super.key,
      required this.index,
      this.title = defaultTitle,
      this.color = defaultColor});

  get tabtext {
    return title == defaultTitle ? "$tabTitle $tabIndex" : title;
  }

  get tabTitle {
    return title;
  }

  get tabIndex {
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 3,
              offset: const Offset(0, 0),
            )
          ]),
      child: Text(
        tabtext,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class _SignleTabView extends StatelessWidget {
  final Color backgoundColor;
  const _SignleTabView({super.key, this.backgoundColor = Colors.white});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: backgoundColor,
      child: _BookList(),
    );
  }
}

class _BookList extends StatefulWidget {
  const _BookList({super.key});

  @override
  State<_BookList> createState() => _BookListState();
}

class _BookListState extends State<_BookList> {
  late List bookList;
  late int displayCount;
  late List<Widget> bookWidgets;

  @override
  initState() {
    super.initState();
    setState(() {
      bookList = [];
      displayCount = BookListConfig.initialBooksCountInView;
      bookWidgets = [];
    });
    initBookList();
  }

  Future<void> initBookList() async {
    bookList = await loadBooks();
    setState(() {
      bookList.shuffle();
      bookWidgets = booksGenerator();
    });
  }

  Future<List> loadBooks() async {
    late List books;
    try {
      String rawJson = await DefaultAssetBundle.of(context)
          .loadString(SlideImageConfig.jsonLocation);
      books = json.decode(rawJson);
    } catch (e) {
      debugPrint('Failed to load JSON data: $e');
    }
    return books;
  }

  List<Widget> booksGenerator() {
    List<Widget> generatedWidgets = [];
    Book currentBook;
    displayCount =
        bookList.length < displayCount ? bookList.length : displayCount;
    for (int i = 0; i < displayCount; i++) {
      currentBook = Book(
        title: bookList[i]["title"],
        text: bookList[i]["text"],
        imageUrl: bookList[i]["img"],
        rating: bookList[i]["rating"],
      );
      generatedWidgets.add(_SingleBook(book: currentBook));
    }
    setState(() {
      bookWidgets = generatedWidgets;
    });
    return generatedWidgets;
  }

  void loadMoreHandler() {
    setState(() {
      displayCount += BookListConfig.loadMoreCount;
    });
    booksGenerator();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: bookWidgets.isNotEmpty
              ? bookWidgets
              : [
                  const CircularProgressIndicator()
                ], // Show loading indicator if empty
        ),
        //_LoadMoreButton(loadMoreHandler),

        Container(
          decoration: BoxDecoration(
            color: AppColors.orange['std'],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            onPressed: () => loadMoreHandler(),
            child: const Text(
              "LOADMORE",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SingleBook extends StatelessWidget {
  final Book book;
  _SingleBook({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        children: [
          _BookImage(
            imageUrl: book.bookImage,
            imageHight: 100,
            imageWidth: 100,
            boxBorderRadius: 8,
          ),
          const SizedBox(width: 10),
          _BookInfo(
            title: book.bookTitle,
            text: book.bookText,
            rating: book.bookRating,
          ),
        ],
      ),
    );
  }
}

class _BookImage extends NetImage {
  final double imageWidth, imageHight, boxBorderRadius;

  const _BookImage({
    super.key,
    required super.imageUrl,
    this.imageWidth = 50,
    this.imageHight = 100,
    this.boxBorderRadius = 8,
  });
}

class _BookInfo extends StatelessWidget {
  final String title, text;
  final double rating;
  const _BookInfo(
      {super.key,
      required this.title,
      required this.text,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: AppColors.black['100'],
                fontSize: 24,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis, // Prevents text overflow
            maxLines: 1, // Limits to 2 lines
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
                color: AppColors.black['300'],
                fontSize: 16,
                fontWeight: FontWeight.normal),
            overflow: TextOverflow.ellipsis, // Prevents text overflow
            maxLines: 2, // Limits to 2 lines
          ),
          Row(
            children: [
              Text(
                rating.toString(),
                style: TextStyle(
                  color: AppColors.yellow['std'],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.star, fill: 0.7, color: Colors.yellow, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:ebook_audio_player/config/ui/app_colors.dart';
import 'package:flutter/material.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});
  @override
  State<NavigationView> createState() => _NavigationView();
}

class _NavigationView extends State<NavigationView>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // Disposing controllers when they are no longer needed
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool isScroll) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            centerTitle: true,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                color: Colors.white,
                child: TabBar(
                  tabAlignment: TabAlignment.center,
                  indicatorPadding: const EdgeInsets.all(0),
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.all(5),
                  isScrollable: true,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 3,
                          offset: const Offset(0, 0),
                        )
                      ]),
                  tabs: [
                    Container(
                      width: 120,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.menuColors['color1'],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 0),
                            )
                          ]),
                      child: const Text(
                        "New",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.menuColors['color2'],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 0),
                            )
                          ]),
                      child: const Text(
                        "Popular",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.menuColors['color3'],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 0),
                            )
                          ]),
                      child: const Text(
                        "Tranding",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            Material(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.menuColors['color1'],
                ),
                title: const Text("This Is content of 'New' !"),
              ),
            ),
            Material(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.menuColors['color2'],
                ),
                title: const Text("This Is content 'Popular' !"),
              ),
            ),
            Material(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.menuColors['color3'],
                ),
                title: const Text("This Is content of 'Tranding' !"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

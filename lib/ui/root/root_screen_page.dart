import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home/home_screen_page.dart';
import '../search/search_screen_page.dart';

class RootScreenPage extends StatefulWidget {
  const RootScreenPage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<RootScreenPage> createState() => _RootScreenPageState();
}

class _RootScreenPageState extends State<RootScreenPage> {
  late final List<String> collectionPathRoute;

  @override
  void initState() {
    super.initState();
    collectionPathRoute = [HomeScreenPage.route, SearchScreenPage.route];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: onTapBottomNavBar,
        selectedIndex: _currentTabIndex,
        destinations: const [
          NavigationDestination(
            label: "Home",
            tooltip: "Home",
            icon: Icon(Icons.home_filled),
          ),
          NavigationDestination(
            label: "Search",
            tooltip: "Search",
            icon: Icon(Icons.search),
          ),
        ],

      ),
    );
  }

  int get _currentTabIndex => collectionPathRoute
      .indexWhere((element) => element == GoRouter.of(context).location);

  void onTapBottomNavBar(int index) =>
      GoRouter.of(context).go(collectionPathRoute[index]);
}

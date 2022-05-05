import 'package:book_reader/ui/explore/explore_screen.dart';
import 'package:book_reader/ui/home/home_screen.dart';
import 'package:book_reader/ui/main/dialog_exit_app.dart';
import 'package:book_reader/ui/settings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChange,
          children: const [HomeScreen(),ExploreScreen(),SettingScreen()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.grey[500],
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Feather.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Feather.compass), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Feather.settings), label: "Settings"),
          ],
          onTap: onTappedItem,
          currentIndex: _page,
        ),
      ),
      onWillPop: DialogExitApp().showExitDialog(context),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

 void onTappedItem(int page) => _pageController.jumpToPage(page);

  onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }
}

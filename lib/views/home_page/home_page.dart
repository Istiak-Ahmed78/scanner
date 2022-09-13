import 'package:flutter/material.dart';

import 'tabs/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final PageController _pageController = PageController();

  void changeNavIndex(int index) {
    _currentIndex = index;
    setState(() {});
    _pageController.animateToPage(_currentIndex,
        curve: Curves.slowMiddle,
        duration: const Duration(
          milliseconds: 200,
        ));
  }

  List<Widget> tabs = const [
    HomeTab(),
    ScannerTab(),
    TextScannerTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: changeNavIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.scanner), label: 'Scanner'),
          BottomNavigationBarItem(
              icon: Icon(Icons.text_fields_outlined), label: 'Text')
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: changeNavIndex,
        children: tabs,
      ),
    );
  }
}

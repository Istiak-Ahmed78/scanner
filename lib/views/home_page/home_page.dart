import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner/data/repos/text_recog.dart';
import 'package:scanner/globals/icons.dart';
import 'package:scanner/utils/actions.dart';
import 'package:scanner/utils/file_operations.dart';
import 'package:scanner/views/text_view_screen/text_view_screen.dart';

import 'tabs/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final double _iconRadius = 30;
  final Color _floatingButtonColor = const Color(0xffe6e6ea);
  final Color _navBarBackColor = const Color(0xfff4b6c2);
  final Color _activeIconColor = const Color(0xfff9f4f4);

  final PageController _pageController = PageController();

  void _changeNavCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _animateToPage(int pageIndex) {
    _pageController.animateToPage(_currentIndex,
        curve: Curves.linear,
        duration: const Duration(
          milliseconds: 300,
        ));
  }

  void _onNavTabChanged(index) {
    _changeNavCurrentIndex(index);
    _animateToPage(index);
  }

  void _onPageChanged(index) {
    _changeNavCurrentIndex(index);
  }

  void scan() async {
    File? file = await FileOperations.pickImage();
    if (file == null) return;
    String? text = await Recognize(file).processText();
    if (text != null) {
      Get.to(() => TextViewScreen(text: text));
      return;
    }
    showToast('No Text found. Try again.');
  }

  List<Widget> tabs = const [
    HomeTab(),
    ScannerTab(),
    TextScannerTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: scan,
        backgroundColor: _floatingButtonColor,
        child: SizedBox(
            height: _iconRadius,
            width: _iconRadius,
            child: Image.asset(KappIcos.scanner2)),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: _navBarBackColor,
          currentIndex: _currentIndex,
          selectedItemColor: _activeIconColor,
          onTap: _onNavTabChanged,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.scanner), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.text_fields_outlined), label: 'Text')
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: tabs,
      ),
    );
  }
}

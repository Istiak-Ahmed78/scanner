import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner/data/repos/recognizing.dart';
import 'package:scanner/globals/icons.dart';
import 'package:scanner/utils/actions.dart';
import 'package:scanner/utils/file_operations.dart';
import 'package:scanner/views/text_view_screen/loading_screen.dart';
import 'package:scanner/views/text_view_screen/phone_number_view_screen.dart';
import 'package:scanner/views/text_view_screen/text_view_screen.dart';

import 'tabs/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  static const double _iconRadius = 30;
  static const Color _floatingButtonColor = Color(0xffe6e6ea);
  static const Color _navBarBackColor = Color(0xff009688);
  static const Color _activeIconColor = Color(0xfff9f4f4);
  static const Color _inactiveColor = Color(0xff283655);

  final PageController _pageController = PageController();

  void _changeNavCurrentIndex(int index) {
    if (index == 1) {
      if (_currentIndex == 0) {
        index = 2;
      } else {
        index = 0;
      }
    }
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

  void _pickPhotoAndStartProcess() async {
    File? file = await FileOperations.pickImage();
    if (file == null) {
      showToast('File is not found.');
      return;
    }
    Get.to(() => PhoneNumberViewScreen(file: file));
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
        onPressed: _pickPhotoAndStartProcess,
        backgroundColor: _floatingButtonColor,
        child: SizedBox(
            height: _iconRadius,
            width: _iconRadius,
            child: Image.asset(KappIcos.phone)),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,

        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     IconButton(onPressed: () {}, icon: Icon(Icons.food_bank)),
        //     SizedBox(
        //       width: 50,
        //     ),
        //     IconButton(onPressed: () {}, icon: Icon(Icons.food_bank)),
        //   ],
        // ),
        child: BottomNavigationBar(
          backgroundColor: _navBarBackColor,
          currentIndex: _currentIndex,
          selectedItemColor: _activeIconColor,
          unselectedItemColor: _inactiveColor,
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

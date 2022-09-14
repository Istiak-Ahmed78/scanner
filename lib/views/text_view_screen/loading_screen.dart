import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner/data/repos/recognizing.dart';
import 'package:scanner/utils/actions.dart';
import 'package:scanner/views/text_view_screen/phone_number_view_screen.dart';

class LoadingShowingScreen extends StatefulWidget {
  final File fileToScan;
  const LoadingShowingScreen({Key? key, required this.fileToScan})
      : super(key: key);

  @override
  State<LoadingShowingScreen> createState() => _LoadingShowingScreenState();
}

class _LoadingShowingScreenState extends State<LoadingShowingScreen> {
  @override
  void initState() {
    // scan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading'),
      ),
    );
  }
}

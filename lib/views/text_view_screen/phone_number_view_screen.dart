import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scanner/data/repos/recognizing.dart';

class PhoneNumberViewScreen extends StatefulWidget {
  // final List<String> phoneNumbers;
  final File file;
  const PhoneNumberViewScreen({Key? key, required this.file}) : super(key: key);

  @override
  State<PhoneNumberViewScreen> createState() => _PhoneNumberViewScreenState();
}

class _PhoneNumberViewScreenState extends State<PhoneNumberViewScreen> {
  late List<String> numbers;
  late Widget child;
  void scan() async {
    child = const Text('Loading');
    numbers = await Recognize(widget.file).scanPhoneNumbers();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    child = const Text('No number found.');
    if (numbers.isNotEmpty) {
      child = ListView(
        shrinkWrap: true,
        children: numbers
            .map<Widget>((e) => ListTile(
                  title: Text(e),
                ))
            .toList(),
      );
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

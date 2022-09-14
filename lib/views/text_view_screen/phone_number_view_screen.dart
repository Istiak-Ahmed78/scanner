import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scanner/data/repos/recognizing.dart';
import 'package:scanner/utils/common_widgets/index.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneNumberViewScreen extends StatelessWidget {
  // final List<String> phoneNumbers;
  final File file;
  const PhoneNumberViewScreen({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureWidget<String?>(
          future: Recognize(file).scanPhoneNumbers(),
          loadedDataWidgetBuilder: (data) {
            late Widget child;
            if (data == null) {
              child = const Text('Sorry, no data widget');
            } else {
              launchUrl(Uri.parse('tel:+1-555-010-999'));
              child = SelectableText(data);
            }
            return Center(
              child: child,
            );
          },
        ),
      ),
    );
  }
}

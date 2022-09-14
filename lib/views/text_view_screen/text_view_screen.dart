import 'package:flutter/material.dart';

class TextViewScreen extends StatelessWidget {
  final String text;
  const TextViewScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(child: SelectableText(text)),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

class TextViewScreen extends StatelessWidget {
  final String text;
  const TextViewScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}

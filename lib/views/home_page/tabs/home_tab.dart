import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner/data/repos/recognizing.dart';
import 'package:scanner/utils/actions.dart';
import 'package:scanner/utils/file_operations.dart';
import 'package:scanner/views/text_view_screen/text_view_screen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: const [
            _ScanTile(
              title: 'Text scan',
              subTitle: 'Scan text from any document',
              suffixIcon: Icon(Icons.text_fields_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScanTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? suffixIcon;
  final VoidCallback? onTab;
  final Color? color;
  const _ScanTile({
    Key? key,
    required this.title,
    required this.subTitle,
    this.suffixIcon,
    this.onTab,
    this.color,
  }) : super(key: key);

  Color get _tileColor => color ?? const Color(0xffc99789);
  static const _subtitleColor = Color(0xff4a4e4d);
  static const _borderColor = Color(0xff54b2a9);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    TextStyle textStyle =
        //  themeData.textTheme.bodyLarge ??
        const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );

    Widget result = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: suffixIcon != null
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: textStyle,
        ),
        Text(
          subTitle,
          style: const TextStyle(
            color: _subtitleColor,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
    if (suffixIcon != null) {
      result = Row(
        children: [
          Expanded(flex: 2, child: result),
          Expanded(flex: 1, child: suffixIcon!),
        ],
      );
    }

    return AspectRatio(
      aspectRatio: 2.4,
      child: InkWell(
        onTap: scanText,
        child: Material(
          elevation: 5,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              side: BorderSide(color: _borderColor, width: 2)),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: result,
            ),
          ),
        ),
      ),
    );
  }

  void scanText() async {
    File? file = await FileOperations.pickImage();
    if (file == null) {
      showToast('Selected file is not available');
      return;
    }
    String? processedText = await Recognize(file).processText();
    if (processedText != null) {
      Get.to(TextViewScreen(text: processedText));
    } else {
      showToast('No text found');
    }
  }
}

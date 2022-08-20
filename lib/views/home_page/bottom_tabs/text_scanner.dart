import 'package:flutter/material.dart';
import 'package:scanner/globals/colors.dart';
import 'package:scanner/utils/common_widgets/common_button.dart';

class TextScanTab extends StatelessWidget {
  const TextScanTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 20);

    const String titleText = 'Scan Text';
    const String subTitle =
        'Scan any paper or document and extract data from that.';

    const TextStyle titleTextStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 25);
    const TextStyle subTitleStyle = TextStyle(color: Colors.grey);

    const Widget title = Text(
      titleText,
      style: titleTextStyle,
    );
    const Widget subTile = Text(
      subTitle,
      textAlign: TextAlign.center,
      style: subTitleStyle,
    );

    Widget buttonWidget = CommonButton(
      onPressed: () {},
      title: 'Scan Text',
      titleColor: Colors.white,
      buttonColor: APPConfig.themeColor,
    );

    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          title,
          subTile,
          buttonWidget,
        ],
      ),
    );
  }
}

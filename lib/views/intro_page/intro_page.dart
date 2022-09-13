import 'package:flutter/material.dart';
import 'package:scanner/globals/colors.dart';
import 'package:scanner/globals/icons.dart';
import 'package:scanner/utils/common_widgets/common_button.dart';
import 'package:scanner/utils/common_widgets/dimens.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);

  final Widget iconWidget = SizedBox(
    height: 70,
    width: 70,
    child: Image.asset(KappIcos.scanner),
  );

  final Widget titleWidget = const Text(
    'Scan',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
  );
  final Widget subTitle = const Text(
    'Extract data from picture.',
    style: TextStyle(
      color: Colors.white,
    ),
  );

  final Widget frowardButton = const CommonButton(
    title: 'Let\'s get started.',
    buttonColor: Colors.white,
    weight: double.infinity,
    height: 45,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: APPConfig.themeColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconWidget,
                const Gap(),
                titleWidget,
                const Gap(),
                subTitle,
                const Gap(
                  times: 2,
                ),
                frowardButton
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scanner/globals/icons.dart';
import 'package:scanner/globals/lotties.dart';

class TextScannerTab extends StatelessWidget {
  const TextScannerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Scan Text of a document',
          style: _themeData.textTheme.titleLarge,
        ),
        Lottie.asset(LottieAssets.scanDoc),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: const StadiumBorder(
                  side: BorderSide(color: Colors.blue, width: 1)),
              padding: const EdgeInsets.symmetric(horizontal: 20)),
          child: SizedBox(
            width: 120,
            child: Row(
              children: [
                SizedBox(height: 30, child: Image.asset(KappIcos.search)),
                Text(
                  'Start scanning',
                  style: _themeData.textTheme.button!.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

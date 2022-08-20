import 'package:flutter/material.dart';
import 'package:scanner/globals/colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.buttonColor,
    this.titleColor,
    this.height,
    this.weight,
  }) : super(key: key);

  final Function()? onPressed;
  final Color? buttonColor;
  final Color? titleColor;
  final String title;
  final double? height, weight;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: weight,
      height: height,
      color: buttonColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      shape: const StadiumBorder(),
      onPressed: onPressed ?? () {},
      child: Text(
        title,
        style: TextStyle(
          color: titleColor ?? APPConfig.themeColor,
        ),
      ),
    );
  }
}

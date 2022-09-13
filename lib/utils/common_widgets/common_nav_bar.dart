import 'package:flutter/material.dart';

class CommonNavBa extends StatelessWidget {
  const CommonNavBa({Key? key, this.backGroundColor}) : super(key: key);

  final Color? backGroundColor;

  static const Color kDefaultBackGroundColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Color effectiveColor = backGroundColor ??
        theme.bottomNavigationBarTheme.backgroundColor ??
        kDefaultBackGroundColor;

    return ClipPath(
      clipper: CurvePaint(),
      child: Container(
        color: Colors.blue,
        constraints: const BoxConstraints(
          minHeight: kBottomNavigationBarHeight,
          minWidth: double.infinity,
        ),
      ),
    );
  }
}

class CurvePaint extends CustomClipper<Path> {
  static double circleRadius = 30;
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2 + circleRadius, 0)
      ..quadraticBezierTo(
          size.width / 2, size.height / 4 * 3, size.width / 2 - circleRadius, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

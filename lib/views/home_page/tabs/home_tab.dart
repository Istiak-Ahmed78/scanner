import 'package:flutter/material.dart';
import 'package:scanner/views/home_page/tabs/widgets/tiles.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: const [
            ScanTile(
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

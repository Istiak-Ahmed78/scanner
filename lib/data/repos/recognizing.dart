import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class Recognize {
  final File _file;
  Recognize(this._file);
  Future<String?> processText() async {
    InputImage image = InputImage.fromFile(_file);
    RecognizedText recognizedText = await TextRecognizer().processImage(image);
    return recognizedText.text;
  }

  bool _isStartsWithNormalCode(String value) => value.startsWith('01');
  bool _isStartWithCountryCode(String value) => value.startsWith('+8801');
  bool _isHasHyphen(String value) => value.contains('-');
  bool _isPhoneNumber(String data) {
    /// If the phone number starts with country code i.e. (+880 for bangladesh).
    /// Then there may have two possibilities
    /// (i) May have hyphen in between such as +8801311-111111 (15 length)
    /// (ii) May don't have. i.e +8801311111111 (14 length)
    /// Again may start normally i.e (not with country code)
    /// Like 01311-111111 (12 length) or 01311111111 (11 length)
    return (_isStartsWithNormalCode(data) && _isHasHyphen(data)
            ? data.length == 12
            : data.length == 11) ||
        (_isStartWithCountryCode(data) && _isHasHyphen(data)
            ? data.length == 15
            : data.length == 14);
  }

  String _extractPhoneNumber(String data) {
    /// To get the phone number. The [data] must have to be a phone number
    assert(_isPhoneNumber(data));
    if (_isStartWithCountryCode(data)) {
      int extractToIndex = _isHasHyphen(data) ? 15 : 14;
      return data.substring(0, extractToIndex);
    } else {
      int extractToIndex = _isHasHyphen(data) ? 12 : 11;
      return data.substring(0, extractToIndex);
    }
  }

  Future<String?> scanPhoneNumber() async {
    InputImage image = InputImage.fromFile(_file);

    /// Processing image
    /// We used Flutter's [google_ml_kit](https://pub.dev/packages/google_ml_kit)
    RecognizedText recognizedText = await TextRecognizer().processImage(image);

    for (final i in recognizedText.blocks) {
      for (final line in i.lines) {
        for (final element in line.elements) {
          String text = element.text;

          /// Checking whether the gotten text is a phone number or not.
          if (_isPhoneNumber(text)) {
            debugPrint('Yes, this is a phone number');

            /// Converting text into phone number
            String phoneNumber = _extractPhoneNumber(text);
            return phoneNumber;
          }
        }
      }
    }
  }
}

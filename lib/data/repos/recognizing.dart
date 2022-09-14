import 'dart:io';
import 'package:google_ml_kit/google_ml_kit.dart';

// abstract class RecognizingOperations {
//   static Future<void> processImage(File imageFile) async {
//     InputImage image = InputImage.fromFile(imageFile);
//     RecognizedText recognizedText = await TextRecognizer().processImage(image);
//     recognizedText.text;
//   }
// }

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
  bool _isPhoneNumber(String data) {
    return _isStartsWithNormalCode(data) || _isStartWithCountryCode(data);
  }

  String _extractPhoneNumber(String data) {
    data.replaceAll(' ', '');
    assert(_isPhoneNumber(data));
    if (_isStartWithCountryCode(data)) {
      return data.substring(0, 14);
    } else {
      return data.substring(0, 11);
    }
  }

  Future<String?> scanPhoneNumbers() async {
    InputImage image = InputImage.fromFile(_file);
    RecognizedText recognizedText = await TextRecognizer().processImage(image);

    String text = recognizedText.text;
    if (_isPhoneNumber(text)) {
      String phoneNumber = _extractPhoneNumber(text);
      return phoneNumber;
    }
  }
}

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
}

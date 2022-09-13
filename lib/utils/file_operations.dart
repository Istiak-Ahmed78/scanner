import 'dart:io';
import 'package:image_picker/image_picker.dart';

abstract class FileOperations {
  static Future<File?> pickImage() async {
    /// Change source if needed
    const ImageSource source = ImageSource.camera;
    XFile? pickedRawImage = await ImagePicker().pickImage(source: source);
    if (pickedRawImage != null) {
      return File(pickedRawImage.path);
    }
  }
}

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickers {
  final ImagePicker picker = ImagePicker();

  Future<File?> pickImage() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static const String imageKey = 'profileImage';


  Future<void> saveImagePath(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(imageKey, imagePath);
  }

  Future<String?> getImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(imageKey);
  }
}

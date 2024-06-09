import 'package:get/get.dart';
import '../view/themes.dart'; // Import themes

class ThemeController extends GetxController {
  var isDark = false.obs;

  void changeTheme(bool state) {
    if (state) {
      Get.changeTheme(darkTheme);
      isDark.value = true;
    } else {
      Get.changeTheme(lightTheme);
      isDark.value = false;
    }
  }
}
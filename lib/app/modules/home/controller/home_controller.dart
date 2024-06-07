import 'package:get/get.dart';

class HomeController extends GetxController {
  var count1 = 0.obs;
  var count2 = 0.obs;
  void increment1() {
    count1++;
  }

  void increment2() {
    count2++;
  }
}
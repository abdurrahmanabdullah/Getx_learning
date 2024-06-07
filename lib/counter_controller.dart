// import 'package:get/get.dart';
//
// class CounterController extends GetxController {
//   var count1 = 0;
//   var count2 = 0;
//   void increment1() {
//     count1++;
//     update(['id1']);
//   }
//
//   void increment2() {
//     count2++;
//     update(['id2']);
//   }
// }

////////////////////////use getx method

import 'package:get/get.dart';

class CounterController extends GetxController {
  var count1 = 0.obs;
  var count2 = 0.obs;
  void increment1() {
    count1++;
  }

  void increment2() {
    count2++;
  }
}
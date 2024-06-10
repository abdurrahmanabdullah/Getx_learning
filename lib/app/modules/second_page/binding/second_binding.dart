import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'package:get_learn/app/modules/second_page/controller/second_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecondController());
  }
}
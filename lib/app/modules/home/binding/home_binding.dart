import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get_learn/app/modules/home/controller/home_controller.dart';
import 'package:get_learn/app/modules/home/controller/theme_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put=>when run  it call when homw view load if need or not ,it allocate memory allocation
    //Get.lazyPut=> when homecontroller use then specific moment initial memory and call

    Get.lazyPut(() => HomeController());
    // Get.lazyPut(() => ThemeController());
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_learn/app/modules/second_page/controller/second_controller.dart';
import 'package:get_storage/get_storage.dart';

class SecondPageView extends GetView<SecondController> {
  SecondPageView({super.key});
  var emailEditingController = TextEditingController();
  var storage = GetStorage();
  final email = ''.obs;
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>? ?? {};
    final String pageTitleFromArg = arguments['name'] ?? 'Default Title';

    storage.listen(() {
      email.value = storage.read('email') ?? ''; // Update reactive variable
    });
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(pageTitleFromArg)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: emailEditingController),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (GetUtils.isEmail(emailEditingController.text)) {
                      storage.write('email', emailEditingController.text);
                      Get.snackbar('correct Email', "save Email Successfully",
                          colorText: Colors.white,
                          backgroundColor: Colors.green,
                          snackPosition: SnackPosition.BOTTOM);
                    } else {
                      Get.snackbar(
                          'Incorrect Email', "provide Email in Valid Format",
                          colorText: Colors.white,
                          backgroundColor: Colors.red,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child: const Text('write'))),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () {
                final emailValue = storage.read('email');
                Get.snackbar(
                  'Your Email Address is ',
                  emailValue ?? 'No Email Found',
                  colorText: Colors.white,
                  backgroundColor: Colors.green,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text('Read')),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () {
                ///-----------    storage.erase();----------remove all saves data
                storage.remove('email');
                Get.snackbar(
                  'Removed Email ',
                  'Email has been removed from storage',
                  colorText: Colors.white,
                  backgroundColor: Colors.orange,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text('Remove Email'))
        ],
      ),
    );
  }
}

//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_learn/app/modules/second_page/controller/second_controller.dart';
// import 'package:get_storage/get_storage.dart';
//
// class SecondPageView extends GetView<SecondController> {
//   SecondPageView({Key? key}) : super(key: key);
//   final emailEditingController = TextEditingController();
//   final storage = GetStorage();
//   final email = ''.obs;  // Reactive variable
//
//   @override
//   Widget build(BuildContext context) {
//     final arguments = Get.arguments as Map<String, dynamic>? ?? {};
//     final String pageTitleFromArg = arguments['name'] ?? 'Default Title';
//     final String myClassFromArg = arguments['class'] ?? 'Default Class';
//
//     // Listen for changes in the 'email' key
//     storage.listen(() {
//       email.value = storage.read('email') ?? '';  // Update reactive variable
//     });
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text(pageTitleFromArg)),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(controller: emailEditingController),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 if (GetUtils.isEmail(emailEditingController.text)) {
//                   storage.write('email', emailEditingController.text);
//                 } else {
//                   Get.snackbar(
//                     'Incorrect Email', "Provide Email in Valid Format",
//                     colorText: Colors.white,
//                     backgroundColor: Colors.red,
//                     snackPosition: SnackPosition.BOTTOM,
//                   );
//                 }
//               },
//               child: const Text('Write'),
//             ),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final emailValue = storage.read('email');
//               Get.snackbar(
//                 'Read Email', emailValue ?? 'No Email Found',
//                 colorText: Colors.white,
//                 backgroundColor: Colors.green,
//                 snackPosition: SnackPosition.BOTTOM,
//               );
//             },
//             child: const Text('Read'),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               storage.remove('email');
//               Get.snackbar(
//                 'Removed Email', 'Email has been removed from storage',
//                 colorText: Colors.white,
//                 backgroundColor: Colors.orange,
//                 snackPosition: SnackPosition.BOTTOM,
//               );
//             },
//             child: const Text('Remove Email'),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               storage.erase();
//               Get.snackbar(
//                 'Cleared Storage', 'All data has been cleared from storage',
//                 colorText: Colors.white,
//                 backgroundColor: Colors.red,
//                 snackPosition: SnackPosition.BOTTOM,
//               );
//             },
//             child: const Text('Clear All Data'),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Obx(() => Text('The Email is ${email.value}'))  // Reactive UI update
//         ],
//       ),
//     );
//   }
// }

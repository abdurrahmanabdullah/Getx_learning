import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'counter_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeView(),
    );
  }
}
//
// class HomeView extends StatelessWidget {
//   HomeView({super.key});
//   final dependency = Get.put(CounterController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           GetBuilder<CounterController>(
//             id: 'id1',
//             builder: (controller) {
//               print('update1');
//               return Text(controller.count1.toString());
//             },
//           ),
//           GetBuilder<CounterController>(
//             id: 'id2',
//             builder: (controller) {
//               print('update2');
//               return Text(controller.count2.toString());
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: Row(
//         children: [
//           FloatingActionButton(
//             onPressed: dependency.increment1,
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             onPressed: dependency.increment2,
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
// }

//////////////////use getx

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final dependency = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetX<CounterController>(
            builder: (controller) {
              print('update1');
              return Text(controller.count1.toString());
            },
          ),
          // GetX<CounterController>(
          //   builder: (controller) {
          //     print('update2');
          //     return Text(controller.count2.toString());
          //   },
          // ),
          Obx(() => Text(dependency.count2.toString()))
        ],
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: dependency.increment1,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: dependency.increment2,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_learn/app/modules/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  // final dependency = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Obx(() => Text(controller.count1.toString())),
          Obx(() => Text(controller.count2.toString()))
        ],
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: controller.increment1,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.increment2,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_learn/app/modules/second_page/controller/second_controller.dart';

class SecondPageView extends GetView<SecondController> {
  SecondPageView({Key? key});

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments passed from the previous page
    final arguments = Get.arguments as Map<String, dynamic>? ?? {};
    final String pageTitleFromArg = arguments['name'] ?? 'Default Title';
    final String myClassFromArg = arguments['class'] ?? 'Default Class';

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(pageTitleFromArg)),
      ),
      body: Center(
        child: Text('Class: $myClassFromArg'),
      ),
    );
  }
}
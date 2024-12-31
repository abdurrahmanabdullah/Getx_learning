import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageOneView extends StatelessWidget {
  const PageOneView({super.key});

  @override
  Widget build(BuildContext context) {
    final price = Get.arguments?['price'] ?? 'No price passed';
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {},
              child: Text(Get.arguments['price'] ?? 'not pass random number'))
        ],
      ),
    );
  }
}
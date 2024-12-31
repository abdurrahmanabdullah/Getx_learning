import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_learn/app/modules/argumentpass/pageone.dart';

class PassValue extends StatelessWidget {
  const PassValue({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            RichText(
                text: TextSpan(
                    text: 'dvestech',
                    style: TextStyle(color: Colors.red),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => PageOneView(), arguments: {
                            "price": Random().nextInt(10000).toString(),
                          })))
          ],
        ),
      ),
    );
  }
}
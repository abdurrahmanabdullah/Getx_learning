// import 'package:get/get.dart';
//
// class HomeController extends GetxController {
//   var count1 = 0.obs;
//   var count2 = 0.obs;
//   void increment1() {
//     count1++;
//   }
//
//   void increment2() {
//     count2++;
//   }
// }
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_learn/app/data/api.dart';
import 'package:get_learn/app/models/contact_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Rx<ContactModel?> contacts = Rx(null);
  Future<ContactModel> fetchContact() async {
    final response = await http.get(Uri.parse(api));
    print(response.body);
    try {
      final model = ContactModel.fromJson(jsonDecode(response.body));
      contacts.value = model;
      return model;
    } catch (e) {
      throw e;
    }
  }
}

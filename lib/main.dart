// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_learn/app/modules/home/view/language.dart';
// import 'package:get_learn/app/routes/app_routes.dart';
//
// import 'app/modules/home/controller/theme_controller.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeController themeController = Get.put(ThemeController());
//     return GetMaterialApp(
//       // theme:
//       //     themeController.isDark.value ? ThemeData.dark() : ThemeData.light(),
//
//       // theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
//
//       translations: Language(),
//       locale: const Locale('en', 'US'),
//       fallbackLocale: const Locale('en', 'US'),
//       debugShowCheckedModeBanner: false,
//       initialRoute: AppRoutes.initialRoute,
//       getPages: AppRoutes.routes,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/home/controller/theme_controller.dart';
import 'app/modules/home/view/themes.dart';
import 'app/modules/home/view/language.dart';
import 'app/routes/app_routes.dart';
// Import themes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(() {
      return GetMaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode:
            themeController.isDark.value ? ThemeMode.dark : ThemeMode.light,
        translations: Language(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.routes,
      );
    });
  }
}
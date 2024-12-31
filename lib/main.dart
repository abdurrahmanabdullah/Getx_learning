import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/home/controller/theme_controller.dart';
import 'app/modules/home/view/language.dart';
import 'app/modules/home/view/themes.dart';
import 'app/routes/app_routes.dart';
// Import themes

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(() {
      return GetMaterialApp(
        theme: themeController.isDark.value ? darkTheme : lightTheme,
        // theme: lightTheme,
        // darkTheme: darkTheme,
        // themeMode:
        //     themeController.isDark.value ? ThemeMode.dark : ThemeMode.light,
        translations: Language(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.argumentpass,
        getPages: AppRoutes.routes,
      );
    });
  }
}
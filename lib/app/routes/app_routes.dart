import 'package:get/get.dart';
import 'package:get_learn/app/modules/home/binding/home_binding.dart';
import 'package:get_learn/app/modules/home/view/home_view.dart';

class AppRoutes {
  static const String initialRoute = '/home';
  static final routes = [
    GetPage(name: '/home', page: () => HomeView(), binding: HomeBinding())
  ];
}
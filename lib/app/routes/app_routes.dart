import 'package:get/get.dart';
import 'package:get_learn/app/modules/home/binding/home_binding.dart';
import 'package:get_learn/app/modules/home/view/home_view.dart';
import 'package:get_learn/app/modules/second_page/view/second_view.dart';

class AppRoutes {
  static String home = "/";
  static String secondPage = "/secondPage";
  static String getHomeRoute() => home;
  static String getSecondPage() => secondPage;
  static List<GetPage> routes = [
    GetPage(name: home, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
        name: secondPage, page: () => SecondPageView(), binding: HomeBinding())
  ];
}

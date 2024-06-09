// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get_learn/app/modules/home/controller/home_controller.dart';
//
// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});
//   // final dependency = Get.put(CounterController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('HomeView'),
//           centerTitle: true,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 controller.fetchContact();
//               },
//               icon: const Icon(Icons.refresh),
//             ),
//           ],
//         ),
//         body: SafeArea(
//             child: FutureBuilder(
//                 future: controller.fetchContact(),
//                 builder: (ctx, snapshot) {
//                   if (snapshot.hasData) {
//                     return Obx(() => ListView.builder(
//                         itemCount: snapshot.data?.results?.length,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(
//                                       10.0), // Adjust the value as needed
//                                   border: Border.all(
//                                     color: Colors.grey[
//                                         400]!, // Adjust the color as needed
//                                     width:
//                                         2.0, // Adjust the border width as needed
//                                   ),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Adjust the shadow color as needed
//                                       spreadRadius: 2,
//                                       blurRadius: 5,
//                                       offset: const Offset(
//                                           0, 3), // Adjust the offset as needed
//                                     ),
//                                   ],
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(
//                                       8.0), // Adjust the value to match the container's border radius
//                                   child: Image.network(
//                                     controller.contacts.value?.results?[index]
//                                             ?.picture?.medium ??
//                                         '',
//                                     fit: BoxFit
//                                         .cover, // Adjust the fit as needed
//                                     width: 100, // Adjust the width as needed
//                                     height: 100, // Adjust the height as needed
//                                   ),
//                                 ),
//                               ),
//                               Text(controller.contacts.value?.results?[index]
//                                       ?.name?.first ??
//                                   ''),
//                               Text(controller.contacts.value?.results?[index]
//                                       ?.name?.last ??
//                                   ''),
//                               Text(controller.contacts.value?.results?[index]
//                                       ?.location?.country ??
//                                   ''),
//                               Text(controller
//                                       .contacts.value?.results?[index]?.email ??
//                                   ''),
//                             ],
//                           );
//
//                           // return Column(
//                           //   children: [
//                           //     Container(
//                           //       decoration: BoxDecoration(
//                           //         borderRadius: BorderRadius.circular(
//                           //             10.0), // Adjust the value as needed
//                           //         border: Border.all(
//                           //           color: Colors.grey[
//                           //               400]!, // Adjust the color as needed
//                           //           width:
//                           //               2.0, // Adjust the border width as needed
//                           //         ),
//                           //         boxShadow: [
//                           //           BoxShadow(
//                           //             color: Colors.grey.withOpacity(
//                           //                 0.5), // Adjust the shadow color as needed
//                           //             spreadRadius: 2,
//                           //             blurRadius: 5,
//                           //             offset: const Offset(
//                           //                 0, 3), // Adjust the offset as needed
//                           //           ),
//                           //         ],
//                           //       ),
//                           //       child: ClipRRect(
//                           //         borderRadius: BorderRadius.circular(
//                           //             8.0), // Adjust the value to match the container's border radius
//                           //         child: Image.network(
//                           //           // snapshot.data?.results?[index]?.picture
//                           //           //         ?.medium ??
//                           //           //     '',
//                           //           controller.contacts.value?.results?[index]
//                           //                   ?.picture?.medium ??
//                           //               '',
//                           //           fit: BoxFit
//                           //               .cover, // Adjust the fit as needed
//                           //           width: 100, // Adjust the width as needed
//                           //           height: 100, // Adjust the height as needed
//                           //         ),
//                           //       ),
//                           //     ),
//                           //     Text(
//                           //         snapshot.data?.results?[index]?.name?.first ??
//                           //             ''),
//                           //     Text(snapshot.data?.results?[index]?.name?.last ??
//                           //         ''),
//                           //     Text(snapshot.data?.results?[index]?.location
//                           //             ?.country ??
//                           //         ''),
//                           //     Text(snapshot.data?.results?[index]?.email ?? ''),
//                           //   ],
//                           // );
//                         }));
//                   } else if (snapshot.hasError) {
//                     return const Text("ffff");
//                   } else {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                 })));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_learn/app/modules/home/controller/home_controller.dart';
import 'package:get_learn/app/modules/home/controller/theme_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key});
  bool isDartMode = false;
  // final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          Obx(() {
            return Switch(
              value: themeController.isDark.value,
              onChanged: (value) {
                themeController.changeTheme(value);
              },
            );
          }),
          IconButton(
            onPressed: () {
              controller.fetchContact();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          final contacts = controller.contacts.value;
          if (contacts == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: contacts.results?.length,
              itemBuilder: (context, index) {
                final contact = contacts.results![index];
                return Column(
                  children: [
                    Image.network(
                      controller.contacts.value?.results?[index]?.picture
                              ?.medium ??
                          '',
                    ),
                    Text(contact.name?.first ?? ''),
                    Text(contact.name?.last ?? ''),
                    Text(contact.location?.country ?? ''),
                    Text(contact.email ?? ''),
                    Text('app_name'.tr, style: const TextStyle(fontSize: 40)),
                    Text('app_title'.tr, style: const TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Get.updateLocale(const Locale('en', 'US'));
                            },
                            child: const Text(" Make Text English")),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Get.updateLocale(const Locale('bn', 'BD'));
                            },
                            child: const Text(" Make Text Bangla"))
                      ],
                    )
                  ],
                );
              },
            );
          }
        }),
      ),
    );
  }
}
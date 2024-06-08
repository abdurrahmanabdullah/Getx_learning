import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_learn/app/modules/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
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

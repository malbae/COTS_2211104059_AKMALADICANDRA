import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import 'homepage_view.dart';
import 'pesananpage_view.dart';
import 'promopage_view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  final List<Widget> pages = const [
    HomePage(),
    PesananPage(),
    PromoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.find();
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            backgroundColor: Colors.white, // Background remains white
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeIndex,
            selectedItemColor:
                Colors.green[800], // Green color for selected Home
            unselectedItemColor:
                Colors.grey, // Gray color for Pesanan and Promo
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt), label: 'Pesanan'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_offer), label: 'Promo'),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find();
    return Scaffold(
      body: PageView(
        onPageChanged: controller.changePage,
        children: const [
          Center(child: Text("Page 1")),
          Center(child: Text("Page 2")),
          Center(child: Text("Page 3")),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentPage.value,
            onTap: controller.changePage,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: "1"),
              BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: "2"),
              BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: "3"),
            ],
          )),
    );
  }
}

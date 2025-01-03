import 'package:get/get.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;
  var isLoggedIn = false.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void login() {
    isLoggedIn.value = true;
  }
}

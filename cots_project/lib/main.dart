import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './design_system/main/bindings/main_binding.dart';
import './design_system/main/views/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'COTS Project',
      initialBinding: MainBinding(),
      home: LoginView(), // Awali dengan LoginView
    );
  }
}

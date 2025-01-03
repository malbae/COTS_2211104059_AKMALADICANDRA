import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_view.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simpan data registrasi (implementasi tergantung kebutuhan)
                Get.off(() => LoginView());
              },
              child: const Text("Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}

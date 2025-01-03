import 'dart:async'; // Untuk Timer

import 'package:cots_project/design_system/main/views/loginview_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final PageController _pageController = PageController();
  late Timer _timer;
  String pageTitle = 'Selamat datang di gojek!';
  String pageDescription =
      'Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin semua kebutuhanmu, kapanpun, dan di manapun.';

  @override
  void initState() {
    super.initState();
    // Menjalankan fungsi untuk scroll otomatis setiap 3 detik
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage > 2)
          nextPage = 0; // Reset ke halaman pertama setelah halaman terakhir
        _pageController.animateToPage(nextPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer
        .cancel(); // Jangan lupa untuk membatalkan timer saat widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Header (Logo dan Bahasa)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.local_taxi,
                        color: Colors.green[800],
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'gojek',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'IND',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Carousel (PageView)
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    // Set text and title based on carousel index
                    if (index == 0) {
                      pageTitle = 'Selamat datang di gojek!';
                      pageDescription =
                          'Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin semua kebutuhanmu, kapanpun, dan di manapun.';
                    } else if (index == 1) {
                      pageTitle = 'Jelajahi fitur kami!';
                      pageDescription =
                          'Nikmati berbagai layanan yang memudahkan hidupmu. Dari transportasi hingga pembayaran, kami siap membantu.';
                    } else {
                      pageTitle = 'Bergabunglah dengan kami!';
                      pageDescription =
                          'Daftar sekarang dan rasakan kemudahan dalam setiap aktivitasmu. Kami ada untuk mempermudah hidupmu.';
                    }
                  });
                },
                children: [
                  // Carousel Page 1 with Image
                  Image.asset(
                    'lib/design_system/images/lgn.png',
                    height: 250, // Menentukan tinggi gambar sedikit lebih besar
                    width:
                        250, // Menentukan lebar gambar sedikit lebih besar, jangan sampai memenuhi layar
                    fit: BoxFit
                        .contain, // Menyesuaikan gambar dalam area tanpa distorsi
                  ),
                  // Carousel Page 2 with Image
                  Image.asset(
                    'lib/design_system/images/cr2.png',
                    height: 250, // Menentukan tinggi gambar sedikit lebih besar
                    width: 250, // Menentukan lebar gambar sedikit lebih besar
                    fit: BoxFit.contain, // Gambar menyesuaikan dalam area
                  ),
                  // Carousel Page 3 with Image
                  Image.asset(
                    'lib/design_system/images/cr1.png',
                    height: 250, // Menentukan tinggi gambar sedikit lebih besar
                    width: 250, // Menentukan lebar gambar sedikit lebih besar
                    fit: BoxFit
                        .contain, // Menyesuaikan gambar dalam area tanpa distorsi
                  ),
                ],
              ),
            ),
            // Indicator Carousel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, _) {
                    final page = _pageController.hasClients
                        ? _pageController.page ?? 0
                        : 0;
                    final isSelected = page.round() == index;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: isSelected ? 12 : 8,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green[800] : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Teks Sambutan yang berubah sesuai dengan carousel
            Text(
              pageTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                pageDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Tombol Masuk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => MainView());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size(double.infinity,
                      48), // Tombol melebar memenuhi lebar layar
                ),
                child: const Text(
                  'Masuk',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Tombol Daftar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => LoginViewDetail());
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green[800]!, width: 2.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size(double.infinity,
                      48), // Tombol melebar memenuhi lebar layar
                ),
                child: Text(
                  'Belum ada akun?, Daftar dulu',
                  style: TextStyle(fontSize: 16, color: Colors.green[800]),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Kebijakan dan Syarat
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text.rich(
                TextSpan(
                  text: 'Dengan masuk atau mendaftar, kamu menyetujui ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: 'Ketentuan layanan',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' dan '),
                    TextSpan(
                      text: 'Kebijakan privasi.',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

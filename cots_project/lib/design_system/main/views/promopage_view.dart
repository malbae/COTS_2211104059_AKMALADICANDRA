import 'dart:async'; // Untuk Timer

import 'package:flutter/material.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  _PromoPageState createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Track the current page index

  late Timer _timer; // Timer for automatic page change

  @override
  void initState() {
    super.initState();

    // Set up a Timer to automatically change pages every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _currentPage + 1;
        if (nextPage > 2) {
          nextPage = 0; // Loop back to the first page
        }
        _pageController.animateToPage(nextPage,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      }
    });

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    _timer
        .cancel(); // Don't forget to cancel the timer when the page is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Promo',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildXpSection(), // XP Progress Bar Section
            SizedBox(height: 16),
            _buildPromoCounts(),
            SizedBox(height: 16),
            _buildPromoCodeInput(),
            SizedBox(height: 24),
            Text('Promo menarik buat kamu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 16),
            _buildPromoCategories(),
            SizedBox(height: 24),
            Text('Biar makin hemat',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 16),
            _buildPromoCarousel(), // Carousel section added here
            SizedBox(height: 24),
            _buildGoPaySection(),
            SizedBox(height: 24),
            Text('Promo menarik dari brand populer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            Text('Buat rileks atau produktif, kamu yang tentuin!',
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildXpSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'lib/design_system/images/sts.png', // Replace with your asset
                height: 40,
                width: 40,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('121 XP to your next treasure',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  SizedBox(height: 4),
                  Container(
                    width: 200,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.6, // XP progress percentage
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget _buildPromoCounts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCountItem('13', 'Vouchers', '13 Akan hangus'),
        _buildCountItem('0', 'Langganan', 'Lagi aktif'),
        _buildCountItem('0', 'Mission', 'Lagi berjalan'),
      ],
    );
  }

  Widget _buildCountItem(String count, String label, String subLabel) {
    return Column(
      children: [
        Text(count,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
        Text(subLabel, style: TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  Widget _buildPromoCodeInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.discount_outlined, color: Colors.orange),
          SizedBox(width: 8),
          Text('Masukan kode promo', style: TextStyle(color: Colors.grey)),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPromoCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryChip('Apa aja', true),
          _buildCategoryChip('GoFood', false),
          _buildCategoryChip('GoPay', false),
          _buildCategoryChip('GoPayLater', false),
          _buildCategoryChip('GoRide', false),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String text, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _buildPromoCarousel() {
    return Column(
      children: [
        // Carousel with PageView
        Container(
          height: 200,
          child: PageView(
            controller: _pageController,
            children: [
              _buildPromoCard('lib/design_system/images/ad_image.png'),
              _buildPromoCard('lib/design_system/images/ad_image.png'),
              _buildPromoCard('lib/design_system/images/ad_image.png'),
            ],
          ),
        ),
        // Indicator
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentPage == index ? 12 : 8,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPromoCard(String imagePath) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 200, // Adjust width as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGoPaySection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Icon(Icons.circle, color: Colors.green, size: 30),
          SizedBox(width: 8),
          Text('GoPay',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}

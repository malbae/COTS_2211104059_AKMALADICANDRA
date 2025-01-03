import 'package:flutter/material.dart';

class PesananPage extends StatelessWidget {
  const PesananPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Pesanan', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.download_for_offline_outlined, color: Colors.grey),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  _buildTabButton('Riwayat', true), // Initially selected
                  SizedBox(width: 8),
                  _buildTabButton('Dalam proses', false),
                  SizedBox(width: 8),
                  _buildTabButton('Terjadwal', false),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGoFoodFilter(),
            SizedBox(height: 16),
            _buildTransactionItem(
              restaurantName: 'Ayam Benjoss, kedungkandang',
              itemCount: 3,
              itemDetails: '2 Paket Ayam Bakar Jum...',
              price: 58800,
              deliveryStatus: 'Makanan sudah diantar',
              deliveryTime: DateTime(2023, 12, 28, 11, 36),
            ),
            _buildTransactionItem(
              restaurantName: 'Ayam Benjoss, kedungkandang',
              itemCount: 3,
              itemDetails: '2 Paket Ayam Bakar Jum...',
              price: 58800,
              deliveryStatus: 'Makanan sudah diantar',
              deliveryTime: DateTime(2023, 12, 28, 11, 36),
            ),
            _buildTransactionItem(
              restaurantName: 'Ayam Benjoss, kedungkandang',
              itemCount: 3,
              itemDetails: '2 Paket Ayam Bakar Jum...',
              price: 58800,
              deliveryStatus: 'Makanan sudah diantar',
              deliveryTime: DateTime(2023, 12, 28, 11, 36),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String text, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green[200] : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: isSelected ? Colors.green[800]! : Colors.transparent),
      ),
      child: Text(text,
          style: TextStyle(
              color: isSelected ? Colors.green[800] : Colors.black,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildGoFoodFilter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('GoFood',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Row(
            children: [
              Text('Status', style: TextStyle(color: Colors.black)),
              Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String restaurantName,
    required int itemCount,
    required String itemDetails,
    required int price,
    required String deliveryStatus,
    required DateTime deliveryTime,
  }) {
    // Format date manually to "dd MMM HH:mm"
    String formattedDate = _formatDate(deliveryTime);

    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.restaurant,
                        color: Colors.red[300]), // Restaurant Icon
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(restaurantName,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('$itemCount item',
                            style: TextStyle(color: Colors.grey)),
                        Text(itemDetails, style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                Text('Rp.${_formatCurrency(price)}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold)), // Format price
              ],
            ),
            SizedBox(height: 8),
            Text(deliveryStatus, style: TextStyle(color: Colors.grey)),
            Text(formattedDate, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child:
                    Text('Pesan lagi', style: TextStyle(color: Colors.green)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Format date to "dd MMM HH:mm"
  String _formatDate(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = _getMonthName(dateTime.month);
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$day $month $hour:$minute';
  }

  // Convert month number to month name
  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  // Format currency manually
  String _formatCurrency(int amount) {
    return amount.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}

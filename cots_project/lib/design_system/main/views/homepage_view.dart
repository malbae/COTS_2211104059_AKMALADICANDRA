import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Find services, food, or places',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  backgroundColor:
                      Colors.green[800], // Adjusted for dark green color
                  radius: 20,
                  child: Icon(
                    Icons.person, // Placeholder for user avatar
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Make body scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GoPay Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[50], // Adjusted background color
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.green[200]!,
                      width: 1), // Add a border for definition
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('GoPay',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('Rp7.434',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text('Tap for history',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        _buildGopayAction(Icons.add, 'Top Up'),
                        SizedBox(width: 10),
                        _buildGopayAction(Icons.arrow_upward, 'Pay'),
                        SizedBox(width: 10),
                        _buildGopayAction(Icons.explore, 'Explore'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Service Icons (Grid)
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Disable GridView scrolling
                children: [
                  _buildServiceIcon(Icons.motorcycle, 'GoRide'),
                  _buildServiceIcon(Icons.directions_car, 'GoCar'),
                  _buildServiceIcon(Icons.restaurant, 'GoFood'),
                  _buildServiceIcon(Icons.send, 'GoSend'),
                  _buildServiceIcon(Icons.shopping_cart, 'GoMart'),
                  _buildServiceIcon(Icons.phone_android, 'GoPulsa'),
                  _buildServiceIcon(Icons.group, 'GoClub'),
                  _buildServiceIcon(Icons.more_horiz, 'More'),
                ],
              ),
              SizedBox(height: 20),

              // XP Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange[700], size: 40),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('XP Points',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('You have 350 XP points',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Restaurants Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Featured Restaurants',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 10),
                    // Placeholder restaurant list
                    _buildRestaurantCard(
                        'McDonald\'s', 'Liberty Street', 'Rp100,000'),
                    _buildRestaurantCard('KFC', 'Main Street', 'Rp120,000'),
                    _buildRestaurantCard(
                        'Pizza Hut', 'Baker Street', 'Rp140,000'),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Ads Section
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('lib/design_system/images/ad_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGopayAction(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.green[800]), // Dark green icons
        Text(label, style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );
  }

  Widget _buildServiceIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.green[800]), // Dark green icons
        SizedBox(height: 5),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildRestaurantCard(
      String restaurant, String location, String price) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(restaurant, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(location,
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginViewDetail extends StatefulWidget {
  const LoginViewDetail({Key? key}) : super(key: key);

  @override
  State<LoginViewDetail> createState() => _LoginViewDetailState();
}

class _LoginViewDetailState extends State<LoginViewDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Gojek's app bar color
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
        title: Row(
          children: [
            // Gojek's logo with circle icon
            Container(
              height: AppBar().preferredHeight, // Match app bar height
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the logo and text
                children: [
                  Icon(
                    Icons.local_taxi, // Same icon as in LoginView
                    color: Colors.green[800], // Green for logo color
                    size: 28,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'gojek',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold, // Bold text
                      color: Colors.green[800], // Green text color
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.question_mark, color: Colors.black),
            onPressed: () {
              // Show help or information dialog
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Enter your registered phone number to log in',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.phone, // Phone number keyboard
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Country code icon with text
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors
                            .green[100], // Light green for the country code
                        border: Border.all(
                          color: Colors.transparent, // Remove border
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        '+62',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green[200]!),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle login action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800], // Dark Green button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                minimumSize: Size(double.infinity, 48), // Full width
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white, // White text color
                ),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

extension on AppBar {
  get preferredHeight => null;
}

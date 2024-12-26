import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
       
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info Section
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/raj prakrash.jpg'), // Replace with your image
                    ),
                    SizedBox(height: 16),
                    Text(
                      'John Doe', // Replace with the user's name
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'john.doe@example.com', // Replace with the user's email
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
              
              // Profile Options
              _buildProfileOption('Edit Profile', Icons.edit, () {
                // Handle edit profile action
              }),
              _buildProfileOption('My Orders', Icons.shopping_cart, () {
                // Navigate to My Orders
              }),
              _buildProfileOption('Wishlist', Icons.favorite, () {
                // Navigate to Wishlist
              }),
              _buildProfileOption('Cart', Icons.shopping_bag, () {
                // Navigate to Cart
              }),
              _buildProfileOption('Settings', Icons.settings, () {
                // Navigate to settings
              }),
              _buildProfileOption('Logout', Icons.logout, () {
                // Handle logout
              }),

              SizedBox(height: 32),

              // Recommended Products Section
              Text(
                'Recommended for You',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 16),
              _buildRecommendedProduct(
                imagePath: 'assets/oil.jpeg',
                title: 'OIL',
                price: '\$50.00',
                onTap: () {
                  // Navigate to Product Detail
                },
              ),
              _buildRecommendedProduct(
                imagePath: 'assets/veg.jpeg',
                title: 'vegetables',
                price: '\$75.00',
                onTap: () {
                  // Navigate to Product Detail
                },
              ),
              _buildRecommendedProduct(
                imagePath: 'assets/dal.jpeg',
                title: 'Dal 1kg',
                price: '\$100.00',
                onTap: () {
                  // Navigate to Product Detail
                },
              ),

              SizedBox(height: 32),

              // Order History Section
              Text(
                'Order History',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 16),
              _buildOrderHistoryItem(
                orderId: '#123456',
                totalAmount: '\$120.00',
                onTap: () {
                  // Navigate to Order Details
                },
              ),
              _buildOrderHistoryItem(
                orderId: '#789101',
                totalAmount: '\$80.00',
                onTap: () {
                  // Navigate to Order Details
                },
              ),
              _buildOrderHistoryItem(
                orderId: '#112233',
                totalAmount: '\$45.00',
                onTap: () {
                  // Navigate to Order Details
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build Profile Option widget
  Widget _buildProfileOption(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      onTap: onTap,
    );
  }

  // Function to build Recommended Product widget
  Widget _buildRecommendedProduct({
    required String imagePath,
    required String title,
    required String price,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(bottom: 16),
        elevation: 5,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(price, style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build Order History Item widget
  Widget _buildOrderHistoryItem({
    required String orderId,
    required String totalAmount,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(bottom: 16),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.receipt, color: Colors.green),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order ID: $orderId', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Total: $totalAmount', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

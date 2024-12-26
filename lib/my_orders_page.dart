import 'package:flutter/material.dart';

// Product model
class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

// Global cart list with sample data
List<Product> cartItems = [
  Product(name: "Fresh Apples", price: 3.5),
  Product(name: "Organic Bananas", price: 2.5),
  Product(name: "Dairy Milk", price: 1.99),
  Product(name: "Whole Wheat Bread", price: 2.0),
  Product(name: "Almonds", price: 5.99),
  Product(name: "Natural Honey", price: 8.75),
  Product(name: "Green Tea", price: 4.2),
  Product(name: "Oats", price: 3.0),
];

// MyOrdersPage
class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: Text(
          'My Orders',
          style: TextStyle(color: Colors.white),
        ),
      
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade100,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.green,
                      ),
                    ),
                    title: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green.shade700,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        removeFromCart(product, context);
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () {
          proceedToPayment(context);
        },
        label: Text(
          'Proceed to Payment',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.payment, color: Colors.white),
      ),
    );
  }

  void removeFromCart(Product product, BuildContext context) {
    cartItems.remove(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} removed from cart'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void proceedToPayment(BuildContext context) {
    if (cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Your cart is empty! Add items before proceeding.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    double total = cartItems.map((e) => e.price).reduce((a, b) => a + b);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Proceed to Payment'),
        content: Text(
          'Your total is \$${total.toStringAsFixed(2)}. Do you want to confirm the payment?',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              cartItems.clear();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Payment Successful!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text('Confirm Payment', style: TextStyle(color: Colors.green)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

// Main Function
void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.green),
    home: MyOrdersPage(),
  ));
}

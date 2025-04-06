import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Product Search',
      home: SearchPage(),
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Product class to hold detailed information
class Product {
  final String title;
  final String image;
  final String description;
  final double price;
  final double originalPrice;
  final String category;
  final int timerSeconds;

  Product({
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.category,
    required this.timerSeconds,
  });
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> allGroceryItems = [
    Product(
      title: 'Apple (1kg)',
      image: 'https://plus.unsplash.com/premium_photo-1667049292983-d2524dd0ef08?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8QXBwbGVzfGVufDB8fDB8fHww',
      description: 'Crisp and juicy apples packed with nutrients.',
      price: 110,
      originalPrice: 140,
      category: 'Fruits',
      timerSeconds: 7200,
    ),
    Product(
      title: 'Oil (1L)',
      image: 'assets/oil.jpeg',
      description: 'Pure cooking oil for healthy meals.',
      price: 120,
      originalPrice: 150,
      category: 'Staples',
      timerSeconds: 86400,
    ),
    Product(
      title: 'Rice (5kg)',
      image: 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8QmFzbWF0aSUyMFJpY2V8ZW58MHx8MHx8fDA%3D',
      description: 'Aromatic long-grain rice ideal for biryanis and pulao.',
      price: 420,
      originalPrice: 500,
      category: 'Staples',
      timerSeconds: 86400,
    ),
    Product(
      title: 'Banana (1 dozen)',
      image: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8QmFuYW5hc3xlbnwwfHwwfHx8MA%3D%3D',
      description: 'Ripe and sweet bananas great for energy and nutrition.',
      price: 35,
      originalPrice: 45,
      category: 'Fruits',
      timerSeconds: 5400,
    ),
    Product(
      title: 'Jam (500g)',
      image: 'assets/jam.jpeg',
      description: 'Sweet fruit jam perfect for breakfast.',
      price: 80,
      originalPrice: 100,
      category: 'Staples',
      timerSeconds: 7200,
    ),
    Product(
      title: 'Vegetables (Mixed 1kg)',
      image: 'assets/veg.jpeg',
      description: 'Fresh mixed vegetables for daily cooking.',
      price: 50,
      originalPrice: 70,
      category: 'Vegetables',
      timerSeconds: 3600,
    ),
    Product(
      title: 'Dry Fruits (500g)',
      image: 'assets/dry fruites.jpeg',
      description: 'Assorted dry fruits rich in nutrients.',
      price: 250,
      originalPrice: 300,
      category: 'Staples',
      timerSeconds: 86400,
    ),
    Product(
      title: 'Dal (1kg)',
      image: 'assets/dal.jpeg',
      description: 'High-protein lentils for nutritious meals.',
      price: 90,
      originalPrice: 110,
      category: 'Staples',
      timerSeconds: 7200,
    ),
    Product(
      title: 'Milk (1L)',
      image: 'assets/milk.jpeg',
      description: 'Fresh dairy milk rich in calcium.',
      price: 55,
      originalPrice: 65,
      category: 'Dairy',
      timerSeconds: 4800,
    ),
    Product(
      title: 'Eggs (12pc)',
      image: 'assets/eggs.jpeg',
      description: 'Farm-fresh eggs high in protein.',
      price: 70,
      originalPrice: 85,
      category: 'Dairy',
      timerSeconds: 5400,
    ),
    Product(
      title: 'Bread (1 loaf)',
      image: 'assets/brread.jpeg',
      description: 'Soft and fresh bread for daily use.',
      price: 30,
      originalPrice: 40,
      category: 'Staples',
      timerSeconds: 3600,
    ),
    Product(
      title: 'Cheese (200g)',
      image: 'assets/cheese.jpeg',
      description: 'Creamy cheese perfect for sandwiches.',
      price: 95,
      originalPrice: 120,
      category: 'Dairy',
      timerSeconds: 5400,
    ),
    Product(
      title: 'Tomatoes (1kg)',
      image: 'https://images.unsplash.com/photo-1524593166156-312f362cada0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8VG9tYXRvZXN8ZW58MHx8MHx8fDA%3D',
      description: 'Juicy red tomatoes perfect for curries and salads.',
      price: 22,
      originalPrice: 30,
      category: 'Vegetables',
      timerSeconds: 3600,
    ),
    Product(
      title: 'Paneer (200g)',
      image: 'https://images.unsplash.com/photo-1589647363585-f4a7d3877b10?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8UGFuZWVyfGVufDB8fDB8fHww',
      description: 'Fresh paneer made from cow milk, ideal for gravies.',
      price: 65,
      originalPrice: 80,
      category: 'Dairy',
      timerSeconds: 4800,
    ),
  ];

  List<Product> filteredGroceryItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredGroceryItems = allGroceryItems;
  }

  void filterGroceryItems(String query) {
    final results = allGroceryItems.where((item) {
      return item.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredGroceryItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Grocery Product Search',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        elevation: 8,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchController,
                onChanged: filterGroceryItems,
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.green.shade700),
                  hintText: 'Enter grocery item name...',
                  prefixIcon: Icon(Icons.search, color: Colors.green),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: filteredGroceryItems.isEmpty
                    ? Center(
                        child: Text(
                          'No items found',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: filteredGroceryItems.length,
                        itemBuilder: (context, index) {
                          return GroceryCard(product: filteredGroceryItems[index]);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GroceryCard extends StatelessWidget {
  final Product product;

  GroceryCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 10,
        shadowColor: Colors.green.shade300,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.green.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: product.image.startsWith('http')
                      ? Image.network(
                          product.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ?? 1)
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/placeholder.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            );
                          },
                        )
                      : Image.asset(
                          product.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green.shade800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  String _formatTimer(int seconds) {
    final hrs = (seconds ~/ 3600).toString().padLeft(2, '0');
    final mins = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$hrs:$mins:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            product.image.startsWith('http')
                ? Image.network(
                    product.image,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: double.infinity,
                        height: 250,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/placeholder.jpg',
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      );
                    },
                  )
                : Image.asset(
                    product.image,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "₹${product.price}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "₹${product.originalPrice}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "${(((product.originalPrice - product.price) / product.originalPrice) * 100).round()}% OFF",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Description:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Category: ${product.category}",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Offer expires in: ${_formatTimer(product.timerSeconds)}",
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

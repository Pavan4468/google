import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'dart:async';

void main() {
  runApp(const SwapSaveApp());
}

class SwapSaveApp extends StatelessWidget {
  const SwapSaveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwapSave',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ProductSwiperPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Product {
  final String title;
  final String image;
  final String description;
  final double price;
  final double originalPrice;
  final String category;
  final int timerSeconds;

  const Product({
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.category,
    required this.timerSeconds,
  });
}

class ProductSwiperPage extends StatefulWidget {
  const ProductSwiperPage({super.key});

  @override
  _ProductSwiperPageState createState() => _ProductSwiperPageState();
}

class _ProductSwiperPageState extends State<ProductSwiperPage> {
  final List<String> categories = ['Daily Needs'];
  String selectedCategory = 'All';

 final List<Product> allProducts = const [
    Product(
      title: 'Organic Toor Dal (2kg)',
      image: 'https://images.unsplash.com/photo-1702041357314-db5826c96f04?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8VG9vciUyMERhbHxlbnwwfHwwfHx8MA%3D%3D',
      description: 'Organic yellow split pigeon peas. Essential for sambar and dal preparations.',
      price: 204,
      originalPrice: 240,
      category: 'Staples',
      timerSeconds: 82800,
    ),
    Product(
      title: 'Fresh Milk (1L)',
      image: 'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8TWlsa3xlbnwwfHwwfHx8MA%3D%3D',
      description: 'Farm fresh dairy milk rich in calcium and vitamins.',
      price: 52,
      originalPrice: 60,
      category: 'Dairy',
      timerSeconds: 7200,
    ),
    Product(
      title: 'Bananas (1 dozen)',
      image: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8QmFuYW5hc3xlbnwwfHwwfHx8MA%3D%3D',
      description: 'Ripe and sweet bananas great for energy and nutrition.',
      price: 35,
      originalPrice: 45,
      category: 'Fruits',
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
      title: 'Basmati Rice (5kg)',
      image: 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8QmFzbWF0aSUyMFJpY2V8ZW58MHx8MHx8fDA%3D',
      description: 'Aromatic long-grain rice ideal for biryanis and pulao.',
      price: 420,
      originalPrice: 500,
      category: 'Staples',
      timerSeconds: 86400,
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
    Product(
      title: 'Apples (1kg)',
      image: 'https://plus.unsplash.com/premium_photo-1667049292983-d2524dd0ef08?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8QXBwbGVzfGVufDB8fDB8fHww',
      description: 'Crisp and juicy apples packed with nutrients.',
      price: 110,
      originalPrice: 140,
      category: 'Fruits',
      timerSeconds: 7200,
    ),
    Product(
      title: 'Carrots (500g)',
      image: 'https://images.unsplash.com/photo-1550411294-b3b1bd5fce1b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fENhcnJvdHN8ZW58MHx8MHx8fDA%3D',
      description: 'Crunchy and sweet carrots for salads and cooking.',
      price: 20,
      originalPrice: 28,
      category: 'Vegetables',
      timerSeconds: 3600,
    ),
    Product(
      title: 'Wheat Flour (5kg)',
      image: 'https://plus.unsplash.com/premium_photo-1671377660174-e43996bfdf03?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8V2hlYXQlMjBGbG91cnxlbnwwfHwwfHx8MA%3D%3D',
      description: 'Whole wheat flour rich in fiber for soft chapatis.',
      price: 180,
      originalPrice: 220,
      category: 'Staples',
      timerSeconds: 86400,
    ),
    Product(
      title: 'Butter (100g)',
      image: 'https://plus.unsplash.com/premium_photo-1673965777407-9ae155fde644?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8QnV0dGVyfGVufDB8fDB8fHww',
      description: 'Creamy and smooth table butter for daily use.',
      price: 48,
      originalPrice: 60,
      category: 'Dairy',
      timerSeconds: 3600,
    ),
    Product(
      title: 'Oranges (1kg)',
      image: 'https://plus.unsplash.com/premium_photo-1675237625695-710b9a6c3f2e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8T3Jhbmdlc3xlbnwwfHwwfHx8MA%3D%3D',
      description: 'Juicy oranges full of vitamin C.',
      price: 55,
      originalPrice: 70,
      category: 'Fruits',
      timerSeconds: 6000,
    ),
    Product(
      title: 'Spinach (1 bunch)',
      image: 'https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8U3BpbmFjaHxlbnwwfHwwfHx8MA%3D%3D',
      description: 'Fresh green spinach for healthy meals.',
      price: 15,
      originalPrice: 20,
      category: 'Vegetables',
      timerSeconds: 2400,
    ),
    Product(
      title: 'Moong Dal (1kg)',
      image: 'https://plus.unsplash.com/premium_photo-1674025751520-01102eca6352?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8TW9vbmclMjBEYWx8ZW58MHx8MHx8fDA%3D',
      description: 'High-protein split moong dal for nutritious dishes.',
      price: 85,
      originalPrice: 100,
      category: 'Staples',
      timerSeconds: 7200,
    ),
    Product(
      title: 'Cheese Slices (200g)',
      image: 'https://plus.unsplash.com/premium_photo-1693086421450-c24655b5aed9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Q2hlZXNlJTIwU2xpY2VzfGVufDB8fDB8fHww',
      description: 'Delicious cheese slices, perfect for sandwiches.',
      price: 95,
      originalPrice: 120,
      category: 'Dairy',
      timerSeconds: 5400,
    ),
    Product(
      title: 'Grapes (500g)',
      image: 'https://plus.unsplash.com/premium_photo-1666270423730-9af384b9cb0f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8R3JhcGVzfGVufDB8fDB8fHww',
      description: 'Fresh seedless grapes for a sweet treat.',
      price: 60,
      originalPrice: 75,
      category: 'Fruits',
      timerSeconds: 4800,
    ),
    Product(
      title: 'Onions (1kg)',
      image: 'https://plus.unsplash.com/premium_photo-1668076517573-fa01307d87ad?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8T25pb25zfGVufDB8fDB8fHww',
      description: 'Essential cooking ingredient with sharp flavor.',
      price: 25,
      originalPrice: 32,
      category: 'Vegetables',
      timerSeconds: 3600,
    ),
    Product(
      title: 'Sugar (1kg)',
      image: 'https://images.unsplash.com/photo-1610219171722-87b3f4170557?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8U3VnYXJ8ZW58MHx8MHx8fDA%3D',
      description: 'Fine granulated sugar for daily use.',
      price: 40,
      originalPrice: 50,
      category: 'Staples',
      timerSeconds: 7200,
    ),
    Product(
      title: 'Curd (500g)',
      image: 'https://images.unsplash.com/photo-1581868164904-77b124b80242?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q3VyZHxlbnwwfHwwfHx8MA%3D%3D',
      description: 'Homemade-style thick curd with probiotics.',
      price: 28,
      originalPrice: 35,
      category: 'Dairy',
      timerSeconds: 2700,
    ),
    Product(
      title: 'Papaya (1pc)',
      image: 'https://images.unsplash.com/photo-1526318472351-c75fcf070305?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8UGFwYXlhfGVufDB8fDB8fHww',
      description: 'Ripe papaya ideal for digestion and smoothies.',
      price: 45,
      originalPrice: 60,
      category: 'Fruits',
      timerSeconds: 4800,
    ),
    Product(
      title: 'Cabbage (1kg)',
      image: 'https://images.unsplash.com/photo-1611105637889-3afd7295bdbf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Q2FiYmFnZXxlbnwwfHwwfHx8MA%3D%3D',
      description: 'Fresh cabbage for salads and stir-fry.',
      price: 18,
      originalPrice: 25,
      category: 'Vegetables',
      timerSeconds: 3000,
    ),
  ];

  int currentIndex = 0;
  Timer? _timer;
  Map<int, int> productTimers = {}; // Store timers for each product index

  @override
  void initState() {
    super.initState();
    // Initialize timers for all products
    for (int i = 0; i < allProducts.length; i++) {
      productTimers[i] = allProducts[i].timerSeconds;
    }
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          final filtered = filteredProducts;
          if (filtered.isNotEmpty && currentIndex < filtered.length) {
            productTimers[currentIndex] = (productTimers[currentIndex] ?? 0) - 1;
            if (productTimers[currentIndex]! <= 0) {
              _nextProduct();
            }
          }
        });
      }
    });
  }

  List<Product> get filteredProducts {
    if (selectedCategory == 'All') {
      return allProducts;
    }
    return allProducts.where((p) => p.category == selectedCategory).toList();
  }

  void _nextProduct() {
    final filtered = filteredProducts;
    if (currentIndex < filtered.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _resetIndex() {
    setState(() {
      currentIndex = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTimer(int seconds) {
    if (seconds <= 0) return "00:00:00";
    final hrs = (seconds ~/ 3600).toString().padLeft(2, '0');
    final mins = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$hrs:$mins:$secs";
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filteredProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("SwapSave"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: FilterChip(
                        label: Text(cat),
                        selected: selectedCategory == cat,
                        onSelected: (_) {
                          setState(() {
                            selectedCategory = cat;
                            _resetIndex();
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: filtered.isEmpty
                  ? const Center(child: Text("No products available in this category."))
                  : Swiper(
                      index: currentIndex,
                      itemCount: filtered.length,
                      loop: false,
                      itemBuilder: (context, index) {
                        return _buildProductCard(context, filtered[index]);
                      },
                      control: const SwiperControl(),
                      onIndexChanged: (i) {
                        setState(() {
                          currentIndex = i;
                        });
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    final timerSeconds = productTimers[allProducts.indexOf(product)] ?? product.timerSeconds;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              product.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image_not_supported, size: 40),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "₹${product.price}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "₹${product.originalPrice}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "${(((product.originalPrice - product.price) / product.originalPrice) * 100).round()}% OFF",
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Expires in ${_formatTimer(timerSeconds)}",
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          
                          
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

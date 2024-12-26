import 'package:flutter/material.dart';


void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Helping Mart',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> bannerImages = [
    'assets/banner.jpeg',
    'assets/banner1.jpeg',
    'assets/banner 3.jpeg',
    'assets/bannner 4.jpeg',
    'assets/banner 5.jpeg',
  ];

  int _currentBannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Helping Mart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
      ),

      body: ListView(
        children: [
          // Banner Images Section (Horizontal Scroll with PageView)
          SizedBox(
            height: 150,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  itemCount: bannerImages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentBannerIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(bannerImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                // Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(bannerImages.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentBannerIndex == index
                            ? Colors.white
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          // Categories Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          // Categories Row - Men, Women, Books, Children
          CategoryRow(
            categoryImages: [
  //              - assets/products.jpeg
  // - assets/daily.jpeg
  // - assets/grocery.jpg
              'assets/products.jpeg', // Image for Men
              'assets/veg.jpeg', // Image for Women
              'assets/grocery.jpg', // Image for Books
              'assets/daily.jpeg', // Image for Children
            ],
            categoryNames: ['Products', 'vegetables', 'grocery', 'daily needs'],
            categoryDescriptions: [
              'good protines', // Description for Men
              'good for health', // Description for Women
              'good protines', // Description for Books
              'neccery needs', // Description for Children
            ],
          ),
          // Fashion Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Needs',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
    
          CategoryRow(
            categoryImages: [
              'assets/oil.jpeg', 
              'assets/rice.jpeg',
              'assets/dal.jpeg', 
              'assets/dry fruites.jpeg', 
            ],
            categoryNames: [  'Oil', 'Rice', 'Dal', 'Dry Fruits',],
            categoryDescriptions: [
              'Pure and healthy ',
  'Premium quality rice ', 
  'Rich and flavorful', 
  'Healthy and tasty ',
            ],
            backgroundColor: Colors.black
          ),
        ],
      ),
    );
  }
}

class CategoryRow extends StatelessWidget {
  final List<String> categoryImages;
  final List<String> categoryNames;
  final List<String> categoryDescriptions;
  final Color? backgroundColor;

  const CategoryRow({
    required this.categoryImages,
    required this.categoryNames,
    required this.categoryDescriptions,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        color: backgroundColor ?? Colors.transparent,
        child: Column(
          children: [
            // Categories Container
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // First Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(2, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemsPage(category: categoryNames[index])),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 125,
                              height: 115,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(categoryImages[index]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              categoryNames[index],
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              categoryDescriptions[index],
                              style: TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 10), // Space between rows
                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(2, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemsPage(category: categoryNames[index + 2])),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 125,
                              height: 115,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(categoryImages[index + 2]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              categoryNames[index + 2],
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              categoryDescriptions[index + 2],
                              style: TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    }),
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



class ItemsPage extends StatelessWidget {
  final String category;

  ItemsPage({required this.category});

  final Map<String, List<Map<String, String>>> items = {
    'Products': [
  {'name': 'Bread','shop name': 'mery foods', 'description': 'Freshly Baked Bread', 'image': 'assets/brread.jpeg', 'price': '50','product expires':'12-jan-2024'},
  {'name': 'Milk', 'description': 'Pure and Fresh Milk', 'image': 'assets/milk.jpeg', 'price': '70','product expires':'12-jan-2024'},
  {'name': 'Rice', 'description': 'Premium Quality Rice', 'image': 'assets/rice.jpeg', 'price': '100','product expires':'12-jan-2024'},
  {'name': 'Jam', 'description': 'Delicious Fruit Jam', 'image': 'assets/jam.jpeg', 'price': '80','product expires':'12-jan-2024'},
],
  
    'vegetables': [
       {'name': 'Bread', 'description': 'Freshly Baked Bread', 'image': 'assets/brread.jpeg', 'price': '50'},
  {'name': 'Milk', 'description': 'Pure and Fresh Milk', 'image': 'assets/milk.jpeg', 'price': '70'},
  {'name': 'Rice', 'description': 'Premium Quality Rice', 'image': 'assets/rice.jpeg', 'price': '100'},
  {'name': 'Jam', 'description': 'Delicious Fruit Jam', 'image': 'assets/jam.jpeg', 'price': '80'},
    ],
     'grocery': [
       {'name': 'Bread', 'description': 'Freshly Baked Bread', 'image': 'assets/brread.jpeg', 'price': '50'},
  {'name': 'Milk', 'description': 'Pure and Fresh Milk', 'image': 'assets/milk.jpeg', 'price': '70'},
  {'name': 'Rice', 'description': 'Premium Quality Rice', 'image': 'assets/rice.jpeg', 'price': '100'},
  {'name': 'Jam', 'description': 'Delicious Fruit Jam', 'image': 'assets/jam.jpeg', 'price': '80'},
    ],
     'daily needs': [
       {'name': 'Bread', 'description': 'Freshly Baked Bread', 'image': 'assets/brread.jpeg', 'price': '50'},
  {'name': 'Milk', 'description': 'Pure and Fresh Milk', 'image': 'assets/milk.jpeg', 'price': '70'},
  {'name': 'Rice', 'description': 'Premium Quality Rice', 'image': 'assets/rice.jpeg', 'price': '100'},
  {'name': 'Jam', 'description': 'Delicious Fruit Jam', 'image': 'assets/jam.jpeg', 'price': '80'},
    ],
    'Oil': [
       {'name': 'Bread', 'description': 'Freshly Baked Bread', 'image': 'assets/brread.jpeg', 'price': '50'},
  {'name': 'Milk', 'description': 'Pure and Fresh Milk', 'image': 'assets/milk.jpeg', 'price': '70'},
  {'name': 'Rice', 'description': 'Premium Quality Rice', 'image': 'assets/rice.jpeg', 'price': '100'},
  {'name': 'Jam', 'description': 'Delicious Fruit Jam', 'image': 'assets/jam.jpeg', 'price': '80'},
    ],
     'Rice': [
       {'name': 'Bread', 'description': 'Freshly Baked Bread', 'image': 'assets/brread.jpeg', 'price': '50'},
  {'name': 'Milk', 'description': 'Pure and Fresh Milk', 'image': 'assets/milk.jpeg', 'price': '70'},
  {'name': 'Rice', 'description': 'Premium Quality Rice', 'image': 'assets/rice.jpeg', 'price': '100'},
  {'name': 'Jam', 'description': 'Delicious Fruit Jam', 'image': 'assets/jam.jpeg', 'price': '80'},
    ],
     'Dal': [
       {'name': 'Bread', 'description': 'Freshly Baked Bread', 'image': 'assets/brread.jpeg', 'price': '50'},
  {'name': 'Milk', 'description': 'Pure and Fresh Milk', 'image': 'assets/milk.jpeg', 'price': '70'},
  {'name': 'Rice', 'description': 'Premium Quality Rice', 'image': 'assets/rice.jpeg', 'price': '100'},
  {'name': 'Jam', 'description': 'Delicious Fruit Jam', 'image': 'assets/jam.jpeg', 'price': '80'},
    ],
     'Dry Fruits': [
       {'name': 'Bread', 'description': 'Freshly Baked Bread', 'image': 'assets/brread.jpeg', 'price': '50'},
  {'name': 'Milk', 'description': 'Pure and Fresh Milk', 'image': 'assets/milk.jpeg', 'price': '70'},
  {'name': 'Rice', 'description': 'Premium Quality Rice', 'image': 'assets/rice.jpeg', 'price': '100'},
  {'name': 'Jam', 'description': 'Delicious Fruit Jam', 'image': 'assets/jam.jpeg', 'price': '80'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category'),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 1,
          mainAxisSpacing: 16,
        ),
        itemCount: items[category]?.length ?? 0,
        itemBuilder: (context, index) {
          return ItemCard(
            item: items[category]![index],
            onAddToCart: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    itemName: items[category]![index]['name']!,
                    itemPrice: double.parse(items[category]![index]['price']!),
                    itemImage: items[category]![index]['image']!,
                    deliveryDate: '2024-11-15',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Map<String, String> item;
  final VoidCallback onAddToCart;

  const ItemCard({required this.item, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(item['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item['name']!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item['description']!,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: onAddToCart,
            child: Text('Add to Cart'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
class CartPage extends StatelessWidget {
  final String itemName;
  final double itemPrice;
  final String itemImage;
  final String deliveryDate;

  CartPage({
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.deliveryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.black,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Cart Item Details
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  // Item Image
                  Image.asset(
                    itemImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16),
                  // Item Name and Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$$itemPrice',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Order Summary
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Price: \$${itemPrice}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Delivery Date: $deliveryDate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Total Cost
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Cost:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${itemPrice}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // Checkout Button
            ElevatedButton(
              onPressed: () {
                // Handle Checkout
              },
              child: Text('Proceed to Checkout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
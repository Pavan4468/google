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

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> allGroceryItems = [
    'Apple',
    'oil',
    'rice',
    'Banana',
    'jam',
    
    'vegetables',
    'dry fruites',
    'Dal',
    'Milk',
    'Eggs',
    'Bread',
    'Cheese',
    
  ];

  List<String> filteredGroceryItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredGroceryItems = allGroceryItems;
  }

  void filterGroceryItems(String query) {
    final results = allGroceryItems.where((item) {
      return item.toLowerCase().contains(query.toLowerCase());
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
                          return GroceryCard(itemName: filteredGroceryItems[index]);
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
  final String itemName;

  GroceryCard({required this.itemName});

  @override
  Widget build(BuildContext context) {
    Map<String, String> groceryImages = {
      'Apple': 'assets/apple.jpeg',
      'oil': 'assets/oil.jpeg',
      'Banana': 'assets/banana.jpeg',
      'rice': 'assets/rice.jpeg',
      'jam': 'assets/jam.jpeg',
      'vegetables': 'assets/veg.jpeg',
      'dry fruites': 'assets/dry fruites.jpeg',
      'Milk': 'assets/milk.jpeg',
      'Eggs': 'assets/eggs.jpeg',
      'Bread': 'assets/brread.jpeg',
      'Cheese': 'assets/cheese.jpeg',//oil.jpeg //dal.jpeg
      'Dal': 'assets/dal.jpeg',
    };

    return Card(
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
                child: Image.asset(
                  groceryImages[itemName] ?? 'assets/placeholder.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                itemName,
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
    );
  }
}

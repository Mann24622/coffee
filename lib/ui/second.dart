import 'package:coffee/ui/third.dart';
import 'package:flutter/material.dart';

import '../utils/image_constant.dart';
import '../utils/utils.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  static String routeName = '/second';

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final List<String> coffeeTypes = [
    'Espresso',
    'Cappuccino',
    'Latte',
    'Mocha',
    'Americano',
  ];

  final List<Map<String, dynamic>> coffeeList = [
    {
      'image': Utils.getImagePath(ImageConstant.image1),
      'isAsset': true,
      'title': 'Espresso',
      'subtitle': 'With Milk',
      'price': '\$6.75',
      'rating': 4.5,
    },

    {
      'image': Utils.getImagePath(ImageConstant.coffee2),
      'isAsset': true,
      'title': 'Cappuccino',
      'subtitle': 'With Cream + Cookies',
      'price': '\$7.55',
      'rating': 4.7,
    },

    {
      'image': Utils.getImagePath(ImageConstant.coffee2),
      'isAsset': true,
      'title': 'Latte',
      'subtitle': 'Vanilla Flavor',
      'price': '\$7.25',
      'rating': 4.6,
    },
  ];


  int selectedIndex = 0;

  int _currentIndex = 0; // To track the selected tab in the bottom navigation

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [

              Container(
                height: 400,
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1C1C1C),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: const TextField(
                                  style: TextStyle(color: Colors.orange),
                                  decoration: InputDecoration(
                                    hintText: 'Search cafe',
                                    hintStyle: TextStyle(color: Colors.orange),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 5,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.search,
                                      size: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            Utils.getImagePath(ImageConstant.profile),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Good Morning",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Grab your first coffee in this morning",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list,
                              color: Colors.white),
                          label: const Text('Filter',
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[900],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: coffeeTypes.length,
                              itemBuilder: (context, index) {
                                final isSelected = index == selectedIndex;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Text(
                                      coffeeTypes[index],
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isSelected
                                          ? Colors.orange
                                          : Colors.grey[900],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 150),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 150)),
                      const Text(
                        "Today's Deal",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,  // Adjust based on your data
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDF6F3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  Utils.getImagePath(ImageConstant.coffeeCup1),
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'BigMac + Fries',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(Icons.star, size: 16, color: Colors.orange),
                                        SizedBox(width: 4),
                                        Text(
                                          '4.5',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          '\$12.75',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.brown,
                                          ),
                                        ),
                                        SizedBox(width: 18),
                                        Text(
                                          '\$20.55',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.red,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange,
                                ),
                                child: const Icon(Icons.add, color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )

              ]),






    ))],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.40,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 250,
              child: Stack(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeList.length,
                    itemBuilder: (context, index) {
                      final coffee = coffeeList[index];
                      return Container(
                        margin: const EdgeInsets.only(left: 20),
                        width: 220,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 25,
                              child: Container(
                                width: 220,
                                height: 207,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 70),
                                    Text(
                                      coffee['title'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      coffee['subtitle'],
                                      style: const TextStyle(
                                          color: Colors.black54),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          coffee['price'],
                                          style: const TextStyle(
                                            color: Colors.orange,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            FloatingActionButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, Third.routeName);
                                              },
                                              mini: true,
                                              backgroundColor: Colors.orange,
                                              child: const Icon(Icons.add,
                                                  color: Colors.black),
                                              elevation: 2,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0.25,
                              left: 20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  coffee['image'],
                                  height: 100,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold, // Bold text for selected item
          fontSize: 14, // Font size for selected item
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12, // Font size for unselected items
        ),
        backgroundColor:
            Colors.white, // Background color of the BottomNavigationBar
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Add to cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),

    );
  }
}

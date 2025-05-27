import 'package:flutter/material.dart';

import '../utils/image_constant.dart';
import '../utils/utils.dart';

class Third extends StatefulWidget {
  const Third({super.key});

  static String routeName = '/third';

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  int selectedSizeIndex = 1; // Default selected size
  int quantity = 1;

  void onSizeSelected(int index) {
    setState(() {
      selectedSizeIndex = index;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  final List<IconData> coffeeIcons = [
    Icons.coffee, // Small size
    Icons.local_cafe, // Medium size
    Icons.local_drink, // Large size
  ];

  int selectedIndex = 0; // Track the selected coffee size index

  bool _showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const SizedBox(height: 40), // Spacing from top
      Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                Utils.getImagePath(ImageConstant.coffee2),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 2,
            left: 5,
            child: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 220,
            left: 10,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.star_rate,
                color: Colors.yellow,
                size: 15,
              ),
              label: const Text('4.5',
                  style: TextStyle(color: Colors.yellow, fontSize: 12)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[900],
              ),
            ),
          ),
        ],
      ),
      const Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                "Espresso",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              Text(
                "with milk",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(right: 150)),
              Text(
                "\$ 6.75",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
              )
            ],
          )
        ],
      ),
      SizedBox(height: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Descriptions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.brown,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _showFullDescription
                ? 'Espresso, (Italian: “fast, express”) is a concentrated form of coffee made by forcing hot water through finely ground coffee under high pressure. It is known for its strong flavor and rich aroma, often served in small shots. Espresso serves as the base for many popular drinks like lattes, cappuccinos, and macchiatos.'
                : 'Espresso, (Italian: “fast, express”) a strong brew of coffee produced by forcing boiled water under pressure through finely ground coffee.',
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _showFullDescription = !_showFullDescription;
              });
            },
            child: Text(
              _showFullDescription ? 'See Less' : 'See More',
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Coffee Size Selector
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Coffee Size',
                        style: TextStyle(fontSize: 18, color: Colors.brown),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(coffeeIcons.length, (index) {
                          final isSelected = index == selectedSizeIndex;
                          return Padding(
                            padding: EdgeInsets.only(
                                right: index != coffeeIcons.length - 1 ? 8.0 : 0),
                            child: GestureDetector(
                              onTap: () => onSizeSelected(index),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected ? Colors.orange : Colors.grey.shade300,
                                ),
                                child: Icon(
                                  coffeeIcons[index],
                                  size: 28,
                                  color: isSelected ? Colors.white : Colors.brown,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              // Quantity Controls
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top:50), // Align vertically
                child: Row(
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.remove, color: Colors.brown),
                      onPressed: decrementQuantity,
                    ),
                    SizedBox(width: 4),
                    Text(
                      quantity.toString(),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 4),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.add, color: Colors.brown),
                      onPressed: incrementQuantity,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center content
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.lock, size: 25),
                  SizedBox(width: 15),
                  Text('Add to Bag', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          )



        ]));
  }
}

import 'package:flutter/material.dart';

import 'car_list_screen.dart';

class CarCategoryScreen extends StatelessWidget {
  final String selectedType;

  const CarCategoryScreen({super.key, required this.selectedType});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'name': 'Economy Class', 'image': 'assets/images/economy.jpg'},
      {'name': 'Standard Class', 'image': 'assets/images/standard.jpg'},
      {'name': 'Premium Class', 'image': 'assets/images/premium.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('$selectedType Categories'),
        centerTitle: true,
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFFCE4EC), Color(0xFFE8EAF6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              'Choose a $selectedType Category',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF37474F),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),

                itemCount: categories.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,

                  crossAxisSpacing: 16,

                  mainAxisSpacing: 16,

                  // 3:4 Aspect Ratio
                  childAspectRatio: 3 / 4,
                ),

                itemBuilder: (context, index) {
                  final category = categories[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(20),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarListScreen(
                            selectedType: selectedType,
                            selectedCategory: category['name']!,
                          ),
                        ),
                      );
                    },

                    child: Card(
                      elevation: 8,

                      margin: EdgeInsets.zero,

                      clipBehavior: Clip.antiAlias,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Column(
                        children: [
                          // CATEGORY IMAGE
                          Expanded(
                            flex: 3,

                            child: SizedBox(
                              width: double.infinity,

                              child: Image.asset(
                                category['image']!,
                                fit: BoxFit.cover,

                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.blue.shade100,

                                    child: const Center(
                                      child: Icon(
                                        Icons.directions_car,
                                        size: 55,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          // CATEGORY NAME
                          Expanded(
                            flex: 1,

                            child: Container(
                              width: double.infinity,

                              alignment: Alignment.center,

                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF1565C0),
                                    Color(0xFF42A5F5),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(8),

                                child: Text(
                                  category['name']!,

                                  textAlign: TextAlign.center,

                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

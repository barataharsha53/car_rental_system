
import 'package:flutter/material.dart';
import 'car_list_screen.dart';

class CarCategoryScreen extends StatelessWidget {
  final String selectedType;

  const CarCategoryScreen({
    super.key,
    required this.selectedType,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Economy Class',
        'image': 'assets/images/economy.jpg',
        'description': 'Affordable cars for everyday travel',
      },
      {
        'name': 'Standard Class',
        'image': 'assets/images/standard.jpg',
        'description': 'Comfortable cars for your journey',
      },
      {
        'name': 'Premium Class',
        'image': 'assets/images/premium.jpg',
        'description': 'Luxury cars for special occasions',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('$selectedType Categories'),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFFCE4EC),
              Color(0xFFE8EAF6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              'Choose a $selectedType Category',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF37474F),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Find the right car for your journey',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmallScreen = constraints.maxWidth < 600;
                  final crossAxisCount = isSmallScreen ? 1 : 3;

                  return GridView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: categories.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio:
                          isSmallScreen ? 1.35 : 0.72,
                    ),
                    itemBuilder: (context, index) {
                      final category = categories[index];

                      return Card(
                        elevation: 7,
                        margin: EdgeInsets.zero,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CarListScreen(
                                  selectedType: selectedType,
                                  selectedCategory:
                                      category['name'] as String,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Image.asset(
                                    category['image'] as String,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) {
                                      return Container(
                                        color: const Color(0xFFBBDEFB),
                                        child: const Center(
                                          child: Icon(
                                            Icons.directions_car,
                                            size: 65,
                                            color: Color(0xFF1565C0),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF1565C0),
                                        Color(0xFF42A5F5),
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        category['name'] as String,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        category['description']
                                            as String,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        'Tap to explore  →',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
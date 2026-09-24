import 'package:flutter/material.dart';

import 'car_category_screen.dart';

class CarTypeScreen extends StatelessWidget {
  const CarTypeScreen({super.key});

  final List<Map<String, String>> carTypes = const [
    {'name': 'Sedan', 'image': 'assets/images/sedan.jpg'},
    {'name': 'Hatchback', 'image': 'assets/images/hatchback.jpg'},
    {'name': 'SUV', 'image': 'assets/images/suv.jpg'},
    {'name': 'MPV', 'image': 'assets/images/mpv.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car Rental System'), centerTitle: true),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFF3E5F5), Color(0xFFFFF3E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Column(
          children: [
            const SizedBox(height: 15),

            const Text(
              'Select the type of car you need',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF37474F),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(15),

                itemCount: carTypes.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 2.0,
                ),

                itemBuilder: (context, index) {
                  final carType = carTypes[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(18),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CarCategoryScreen(selectedType: carType['name']!),
                        ),
                      );
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),

                        child: Stack(
                          fit: StackFit.expand,

                          children: [
                            Image.asset(
                              carType['image']!,
                              fit: BoxFit.cover,

                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.blueGrey.shade100,

                                  child: const Icon(
                                    Icons.directions_car,
                                    size: 50,
                                    color: Colors.blue,
                                  ),
                                );
                              },
                            ),

                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black87],
                                ),
                              ),
                            ),

                            Align(
                              alignment: Alignment.bottomCenter,

                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12),

                                child: Text(
                                  carType['name']!,

                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

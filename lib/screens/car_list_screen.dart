
import 'package:flutter/material.dart';
import 'car_details_screen.dart';

class CarListScreen extends StatelessWidget {
  final String selectedType;
  final String selectedCategory;

  const CarListScreen({
    super.key,
    required this.selectedType,
    required this.selectedCategory,
  });

  List<Map<String, String>> getCars() {
    if (selectedType == 'Sedan') {
      if (selectedCategory == 'Economy Class') {
        return [
          {
            'name': 'Honda Amaze',
            'price': '₹2500/day',
            'image': 'assets/images/amaze.webp',
          },
        ];
      }
      if (selectedCategory == 'Standard Class') {
        return [
          {
            'name': 'Honda City',
            'price': '₹3500/day',
            'image': 'assets/images/city.webp',
          },
        ];
      }
      return [
        {
          'name': 'Skoda Slavia',
          'price': '₹5000/day',
          'image': 'assets/images/slavia.webp',
        },
      ];
    }

    if (selectedType == 'Hatchback') {
      if (selectedCategory == 'Economy Class') {
        return [
          {
            'name': 'Maruti Swift',
            'price': '₹2000/day',
            'image': 'assets/images/swift.webp',
          },
        ];
      }
      if (selectedCategory == 'Standard Class') {
        return [
          {
            'name': 'Hyundai i20',
            'price': '₹3000/day',
            'image': 'assets/images/i20.webp',
          },
        ];
      }
      return [
        {
          'name': 'Maruti Baleno',
          'price': '₹3500/day',
          'image': 'assets/images/baleno.webp',
        },
      ];
    }

    if (selectedType == 'SUV') {
      if (selectedCategory == 'Economy Class') {
        return [
          {
            'name': 'Maruti Brezza',
            'price': '₹3000/day',
            'image': 'assets/images/brezza.webp',
          },
        ];
      }
      if (selectedCategory == 'Standard Class') {
        return [
          {
            'name': 'Hyundai Creta',
            'price': '₹4000/day',
            'image': 'assets/images/creta.webp',
          },
        ];
      }
      return [
        {
          'name': 'Hyundai Creta Premium',
          'price': '₹5500/day',
          'image': 'assets/images/creta.webp',
        },
      ];
    }

    if (selectedType == 'MPV') {
      if (selectedCategory == 'Economy Class') {
        return [
          {
            'name': 'Kia Carens',
            'price': '₹3500/day',
            'image': 'assets/images/carens.webp',
          },
        ];
      }
      if (selectedCategory == 'Standard Class') {
        return [
          {
            'name': 'Toyota Innova',
            'price': '₹5000/day',
            'image': 'assets/images/innova.webp',
          },
        ];
      }
      return [
        {
          'name': 'Kia Carnival',
          'price': '₹7000/day',
          'image': 'assets/images/carnival.webp',
        },
      ];
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    final cars = getCars();

    return Scaffold(
      appBar: AppBar(
        title: Text('$selectedCategory Cars'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFF3E5F5),
              Color(0xFFE8F5E9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: cars.isEmpty
            ? const Center(
                child: Text(
                  'No cars available',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: cars.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final car = cars[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarDetailsScreen(
                            carName: car['name']!,
                            carPrice: car['price']!,
                            carImage: car['image']!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 6,
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: double.infinity,
                              child: Image.asset(
                                car['image']!,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(
                                      Icons.directions_car,
                                      size: 70,
                                      color: Colors.blue,
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
                              color: Colors.white,
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    car['name']!,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    car['price']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
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
              ),
      ),
    );
  }
}

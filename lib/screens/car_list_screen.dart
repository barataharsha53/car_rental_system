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

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> cars = [];

    // ================= SEDAN =================
    if (selectedType == 'Sedan') {
      if (selectedCategory == 'Economy Class') {
        cars = [
          {
            'name': 'Maruti Suzuki Dzire',
            'price': '₹2500/day',
            'image': 'assets/images/dzire.jpg',
          },
        ];
      } else if (selectedCategory == 'Standard Class') {
        cars = [
          {
            'name': 'Honda City',
            'price': '₹3500/day',
            'image': 'assets/images/city.jpg',
          },
        ];
      } else if (selectedCategory == 'Premium Class') {
        cars = [
          {
            'name': 'Skoda Slavia',
            'price': '₹5000/day',
            'image': 'assets/images/slavia.jpg',
          },
        ];
      }
    }
    // ================= HATCHBACK =================
    else if (selectedType == 'Hatchback') {
      if (selectedCategory == 'Economy Class') {
        cars = [
          {
            'name': 'Maruti Swift',
            'price': '₹2000/day',
            'image': 'assets/images/swift.jpg',
          },
        ];
      } else if (selectedCategory == 'Standard Class') {
        cars = [
          {
            'name': 'Hyundai i20',
            'price': '₹3000/day',
            'image': 'assets/images/i20.jpg',
          },
        ];
      } else if (selectedCategory == 'Premium Class') {
        cars = [
          {
            'name': 'Hyundai i20 Premium',
            'price': '₹3500/day',
            'image': 'assets/images/i20.jpg',
          },
        ];
      }
    }
    // ================= SUV =================
    else if (selectedType == 'SUV') {
      if (selectedCategory == 'Economy Class') {
        cars = [
          {
            'name': 'Maruti Brezza',
            'price': '₹3000/day',
            'image': 'assets/images/brezza.jpg',
          },
        ];
      } else if (selectedCategory == 'Standard Class') {
        cars = [
          {
            'name': 'Hyundai Creta',
            'price': '₹4000/day',
            'image': 'assets/images/creata.jpg',
          },
        ];
      } else if (selectedCategory == 'Premium Class') {
        cars = [
          {
            'name': 'Hyundai Venue',
            'price': '₹5500/day',
            'image': 'assets/images/venue.jpg',
          },
        ];
      }
    }
    // ================= MPV =================
    else if (selectedType == 'MPV') {
      if (selectedCategory == 'Economy Class') {
        cars = [
          {
            'name': 'Kia Carens',
            'price': '₹3500/day',
            'image': 'assets/images/kia_carens.jpg',
          },
        ];
      } else if (selectedCategory == 'Standard Class') {
        cars = [
          {
            'name': 'Toyota Innova',
            'price': '₹5000/day',
            'image': 'assets/images/innova.jpg',
          },
        ];
      } else if (selectedCategory == 'Premium Class') {
        cars = [
          {
            'name': 'Kia Carnival',
            'price': '₹7000/day',
            'image': 'assets/images/carnival.jpg',
          },
        ];
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('$selectedCategory Cars'), centerTitle: true),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFF3E5F5), Color(0xFFE8F5E9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: cars.isEmpty
            ? const Center(
                child: Text(
                  'No cars available',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: cars.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
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
                                  return Container(
                                    color: Colors.blue.shade50,
                                    child: const Center(
                                      child: Icon(
                                        Icons.directions_car,
                                        size: 70,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    car['name']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    car['price']!,
                                    style: const TextStyle(
                                      fontSize: 15,
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

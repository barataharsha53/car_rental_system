
import 'package:flutter/material.dart';

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
    final List<Map<String, dynamic>> cars = [
      {
        'name': 'Maruti Swift',
        'price': 1800,
        'seats': 5,
        'fuel': 'Petrol',
        'icon': Icons.directions_car,
      },
      {
        'name': 'Hyundai i20',
        'price': 2200,
        'seats': 5,
        'fuel': 'Petrol',
        'icon': Icons.directions_car_filled,
      },
      {
        'name': 'Hyundai Creta',
        'price': 3200,
        'seats': 5,
        'fuel': 'Petrol',
        'icon': Icons.directions_car,
      },
      {
        'name': 'Toyota Innova',
        'price': 4000,
        'seats': 7,
        'fuel': 'Diesel',
        'icon': Icons.airport_shuttle,
      },
      {
        'name': 'Toyota Camry',
        'price': 5500,
        'seats': 5,
        'fuel': 'Hybrid',
        'icon': Icons.directions_car_filled,
      },
      {
        'name': 'Premium Luxury Car',
        'price': 7500,
        'seats': 5,
        'fuel': 'Petrol',
        'icon': Icons.car_rental,
      },
    ];

    final List<Map<String, dynamic>> filteredCars;

    if (selectedCategory == 'Economy Class') {
      filteredCars = cars.where((car) => car['price'] <= 2500).toList();
    } else if (selectedCategory == 'Standard Class') {
      filteredCars = cars
          .where((car) =>
              car['price'] > 2500 && car['price'] <= 4500)
          .toList();
    } else {
      filteredCars =
          cars.where((car) => car['price'] > 4500).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFFCE4EC),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                '$selectedType • ${filteredCars.length} cars available',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: filteredCars.isEmpty
                  ? const Center(
                      child: Text('No cars available in this category.'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      itemCount: filteredCars.length,
                      itemBuilder: (context, index) {
                        final car = filteredCars[index];

                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.only(bottom: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: CircleAvatar(
                              radius: 28,
                              backgroundColor:
                                  const Color(0xFFBBDEFB),
                              child: Icon(
                                car['icon'] as IconData,
                                color: const Color(0xFF1565C0),
                                size: 30,
                              ),
                            ),
                            title: Text(
                              car['name'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                '${car['seats']} seats • ${car['fuel']}\n'
                                '₹${car['price']} per day',
                              ),
                            ),
                            isThreeLine: true,
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                builder: (dialogContext) {
                                  return AlertDialog(
                                    title: Text(
                                      car['name'] as String,
                                    ),
                                    content: Text(
                                      'Category: $selectedCategory\n'
                                      'Fuel: ${car['fuel']}\n'
                                      'Seats: ${car['seats']}\n'
                                      'Price: ₹${car['price']} per day\n\n'
                                      'This is a demonstration app. '
                                      'Actual availability and pricing '
                                      'must be verified before booking.',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(dialogContext),
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
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
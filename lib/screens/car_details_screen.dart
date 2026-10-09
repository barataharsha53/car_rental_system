import 'package:flutter/material.dart';

import 'booking_screen.dart';

class CarDetailsScreen extends StatelessWidget {
  final String carName;
  final String carPrice;
  final String carImage;

  const CarDetailsScreen({
    super.key,
    required this.carName,
    required this.carPrice,
    required this.carImage,
  });

  // ==========================================
  // GET DETAILS FOR EACH CAR
  // ==========================================
  Map<String, String> getCarDetails() {
    switch (carName.toLowerCase()) {
      // BREZZA
      case 'maruti suzuki brezza':
      case 'brezza':
        return {
          'Seating Capacity': '5 Passengers',
          'Fuel Type': 'Petrol',
          'Transmission': 'Manual / Automatic',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '328 L',
          'Mileage': '17 km/l',
        };

      // CRETA
      case 'hyundai creta':
      case 'creta':
        return {
          'Seating Capacity': '5 Passengers',
          'Fuel Type': 'Petrol / Diesel',
          'Transmission': 'Manual / Automatic',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '433 L',
          'Mileage': '18 km/l',
        };

      // INNOVA
      case 'toyota innova':
      case 'innova':
        return {
          'Seating Capacity': '7 Passengers',
          'Fuel Type': 'Diesel',
          'Transmission': 'Manual / Automatic',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '300 L',
          'Mileage': '15 km/l',
        };

      // KIA CARENS
      case 'kia carens':
      case 'carens':
        return {
          'Seating Capacity': '7 Passengers',
          'Fuel Type': 'Petrol / Diesel',
          'Transmission': 'Manual / Automatic',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '216 L',
          'Mileage': '16 km/l',
        };

      // SWIFT
      case 'maruti suzuki swift':
      case 'swift':
        return {
          'Seating Capacity': '5 Passengers',
          'Fuel Type': 'Petrol',
          'Transmission': 'Manual / Automatic',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '265 L',
          'Mileage': '22 km/l',
        };

      // BALENO
      case 'maruti suzuki baleno':
      case 'baleno':
        return {
          'Seating Capacity': '5 Passengers',
          'Fuel Type': 'Petrol',
          'Transmission': 'Manual / Automatic',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '318 L',
          'Mileage': '22 km/l',
        };

      // AMAZE
      case 'honda amaze':
      case 'amaze':
        return {
          'Seating Capacity': '5 Passengers',
          'Fuel Type': 'Petrol',
          'Transmission': 'Manual / Automatic',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '416 L',
          'Mileage': '19 km/l',
        };

      // HONDA CITY
      case 'honda city':
      case 'city':
        return {
          'Seating Capacity': '5 Passengers',
          'Fuel Type': 'Petrol',
          'Transmission': 'Manual / Automatic',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '506 L',
          'Mileage': '18 km/l',
        };

      // HYUNDAI i20
      case 'hyundai i20':
      case 'i20':
        return {
          'Seating Capacity': '5 Passengers',
          'Fuel Type': 'Petrol',
          'Transmission': 'Manual / Automatic',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '311 L',
          'Mileage': '20 km/l',
        };

      // SKODA SLAVIA
      case 'skoda slavia':
      case 'slavia':
        return {
          'Seating Capacity': '5 Passengers',
          'Fuel Type': 'Petrol',
          'Transmission': 'Manual / Automatic',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '521 L',
          'Mileage': '19 km/l',
        };

      // KIA CARNIVAL
      case 'kia carnival':
      case 'carnival':
        return {
          'Seating Capacity': '7 Passengers',
          'Fuel Type': 'Diesel',
          'Transmission': 'Automatic',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '627 L',
          'Mileage': '14 km/l',
        };

      // TOYOTA VELLFIRE
      case 'toyota vellfire':
      case 'vellfire':
      case 'velfire':
        return {
          'Seating Capacity': '7 Passengers',
          'Fuel Type': 'Hybrid Petrol',
          'Transmission': 'Automatic',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '148 L',
          'Mileage': '19 km/l',
        };

      // DEFAULT
      default:
        return {
          'Seating Capacity': '5 Passengers',
          'Fuel Type': 'Petrol',
          'Transmission': 'Manual',
          'Air Conditioning': 'Available',
          'Luggage Capacity': '300 L',
          'Mileage': '18 km/l',
        };
    }
  }

  // ==========================================
  // ICON FOR EACH DETAIL
  // ==========================================
  IconData getDetailIcon(String title) {
    switch (title) {
      case 'Seating Capacity':
        return Icons.people;

      case 'Fuel Type':
        return Icons.local_gas_station;

      case 'Transmission':
        return Icons.settings;

      case 'Air Conditioning':
        return Icons.ac_unit;

      case 'Luggage Capacity':
        return Icons.luggage;

      case 'Mileage':
        return Icons.speed;

      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final details = getCarDetails();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Details'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),

      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFF3E5F5), Color(0xFFFFF3E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ==========================================
              // CAR IMAGE
              // ==========================================

              Container(
                height: 250,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),

                  child: Image.asset(
                    carImage,
                    fit: BoxFit.contain,

                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.directions_car,
                          size: 100,
                          color: Colors.blue,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ==========================================
              // CAR NAME
              // ==========================================
              Text(
                carName,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // ==========================================
              // PRICE
              // ==========================================
              Text(
                carPrice,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 30),

              // ==========================================
              // DETAILS TITLE
              // ==========================================
              const Text(
                'Car Details',
                textAlign: TextAlign.center,

                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // ==========================================
              // DETAILS LINE BY LINE
              // ==========================================
              ...details.entries.map(
                (detail) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),

                  child: Row(
                    children: [
                      Icon(
                        getDetailIcon(detail.key),
                        color: const Color(0xFF1976D2),
                        size: 28,
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Text(
                          '${detail.key}: ${detail.value}',

                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                height: 55,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) => BookingScreen(
                          carName: carName,
                          carPrice: carPrice,
                          carImage: carImage,
                        ),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: const Text(
                    'Book Now',

                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

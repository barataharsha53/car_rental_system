import 'package:flutter/material.dart';

import 'booking_confirmation_screen.dart';

class BookingScreen extends StatefulWidget {
  final String carName;
  final String carPrice;
  final String carImage;

  const BookingScreen({
    super.key,
    required this.carName,
    required this.carPrice,
    required this.carImage,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? selectedDate;

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Your Car')),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(20),
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    widget.carImage,
                    height: 180,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    widget.carName,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.carPrice,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  ElevatedButton.icon(
                    onPressed: selectDate,
                    icon: const Icon(Icons.calendar_today),
                    label: Text(
                      selectedDate == null
                          ? 'Select Booking Date'
                          : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: selectedDate == null
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingConfirmationScreen(
                                  carName: widget.carName,
                                  carPrice: widget.carPrice,
                                  bookingDate:
                                      '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                ),
                              ),
                            );
                          },
                    child: const Text('Confirm Booking'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

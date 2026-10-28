
import 'package:flutter_test/flutter_test.dart';
import 'package:car_rental_app/main.dart';

void main() {
  testWidgets('Car Rental System starts', (WidgetTester tester) async {
    await tester.pumpWidget(const CarRentalApp());
    expect(find.byType(CarRentalApp), findsOneWidget);
  });
}

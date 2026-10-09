import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_project/main.dart';

void main() {
  testWidgets('Car Rental System loads successfully', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CarRentalApp());

    expect(find.text('Car Rental System'), findsOneWidget);
  });
}

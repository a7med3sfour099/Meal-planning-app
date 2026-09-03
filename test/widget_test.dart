import 'package:flutter_test/flutter_test.dart';
import 'package:mealplan/main.dart';

void main() {
  testWidgets('MyApp loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Plateful'), findsOneWidget);
  });
}
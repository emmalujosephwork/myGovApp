import 'package:flutter_test/flutter_test.dart';
import 'package:citizen_app/main.dart';

void main() {
  testWidgets('Citizen app loads login page',
      (WidgetTester tester) async {

    await tester.pumpWidget(const CitizenApp());

    expect(find.text('Citizen Login'), findsOneWidget);

    expect(find.text('Email'), findsOneWidget);

    expect(find.text('Password'), findsOneWidget);

    expect(find.text('Login'), findsOneWidget);
  });
}
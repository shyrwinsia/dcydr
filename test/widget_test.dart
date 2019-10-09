import 'package:flutter_test/flutter_test.dart';
import 'package:choosr/main.dart';

void main() {
  testWidgets('Smoke Test: Check if it loads', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Choosr());

    // Verify random picker rendered correctly
    expect(find.text('Choosr'), findsOneWidget);
  });
}

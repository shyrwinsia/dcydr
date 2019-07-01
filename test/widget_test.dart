import 'package:flutter_test/flutter_test.dart';
import 'package:RandoomPickr/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(RandoomPickr());

    // Verify random picker rendered correctly
    expect(find.text('Randoom Pickr'), findsOneWidget);
  });
}

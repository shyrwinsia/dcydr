import 'package:dcydr/main.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke Test: Check if it loads', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Dcydr());
    expect(find.text('Dcydr'), findsOneWidget);
  });

  testWidgets('Add a List: Without items', (WidgetTester tester) async {
    await tester.pumpWidget(Dcydr());
    // expect to see an add button
    expect(find.byIcon(FlatIcons.add_2), findsOneWidget);
    await tester.tap(find.byIcon(FlatIcons.add_2));
    // wait for the animation to complete
    await tester.pumpAndSettle();
    // expect to be in the add page
    expect(find.text('Build new list'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'List 0');
    await tester.tap(find.text('Save'));
    // wait for the animation to complete
    await tester.pumpAndSettle();
    expect(find.text('List 0'), findsOneWidget);
  });

  testWidgets('Add a List: One item', (WidgetTester tester) async {
    await tester.pumpWidget(Dcydr());
    expect(find.byIcon(FlatIcons.add_2), findsOneWidget);

    await tester.tap(find.byIcon(FlatIcons.add_2));
    await tester.pumpAndSettle();

    expect(find.text('Build new list'), findsOneWidget);
    expect(find.byIcon(FlatIcons.add), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Enter list name'), findsOneWidget);

    await tester.tap(find.byIcon(FlatIcons.add));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(TextField, 'Enter item name'), findsOneWidget);
    expect(find.text('Add'), findsOneWidget);

    await tester.enterText(
        find.widgetWithText(TextField, 'Enter item name'), 'Item 1');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.widgetWithText(Row, 'Add item'), findsOneWidget);

    await tester.enterText(
        find.widgetWithText(TextField, 'Enter list name'), 'List 1');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('List 1'), findsOneWidget);
  });
}

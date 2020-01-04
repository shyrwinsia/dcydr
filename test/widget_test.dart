import 'package:dcydr/bloc/router/bloc.dart';
import 'package:dcydr/bloc/router/state.dart';
import 'package:dcydr/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  RouterBloc router;

  setUp(() {
    router = RouterBloc();
  });

  tearDown(() {
    router?.close();
  });

  test('Initial route state is correct', () {
    expect(router.initialState, RouterHomePage());
  });

  testWidgets('Smoke Test: Check if it loads', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Dcydr());
    expect(find.text('Dcydr'), findsOneWidget);
  });
}

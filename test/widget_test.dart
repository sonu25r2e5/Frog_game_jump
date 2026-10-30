// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flame/game.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:game_app/main.dart';

void main() {
  testWidgets('Game widget renders', (WidgetTester tester) async {
    await tester.pumpWidget(GameWidget(game: PixelAdventure()));
    await tester.pump();

    expect(
      find.byWidgetPredicate((widget) => widget is GameWidget<PixelAdventure>),
      findsOneWidget,
    );
  });
}

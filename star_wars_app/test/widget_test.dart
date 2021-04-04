import 'package:flutter_test/flutter_test.dart';
import 'package:star_wars_app/src/page/start_page.dart';
import 'helper.dart';

void main() {
    testWidgets('Start Page Test', (WidgetTester tester) async {
    final startPage = LoadWidgetToTest(widget: new StartPage(),);
    await tester.pumpWidget(startPage);
    expect(find.byWidget(startPage), findsOneWidget);

    });
}
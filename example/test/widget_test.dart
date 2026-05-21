import 'package:example/src/my_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows media picker actions', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Easy Device Media'), findsOneWidget);
    expect(find.text('Pick Image(Crop)'), findsOneWidget);
    expect(find.text('Pick Image'), findsOneWidget);
    expect(find.text('Pick Video'), findsOneWidget);
  });
}

import 'package:example/src/my_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'helpers/screenshot_helper.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await binding.convertFlutterSurfaceToImage();
  });

  testWidgets('saves home screen screenshot', (tester) async {
    await prepareScreenshotSurface(tester);
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Easy Device Media'), findsOneWidget);
    expect(find.text('Pick Image(Crop)'), findsOneWidget);
    expect(find.text('Pick Image'), findsOneWidget);
    expect(find.text('Pick Video'), findsOneWidget);

    await saveScreenshot(binding, tester, 'easy_device_media_home');
  });
}

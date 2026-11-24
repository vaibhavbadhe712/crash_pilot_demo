import 'package:flutter_test/flutter_test.dart';
import 'package:crash_pilot_demo/main.dart';

void main() {
  testWidgets('ChatScreen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('CrashPilot Demo Chat'), findsOneWidget);
  });
}

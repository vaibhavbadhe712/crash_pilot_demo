import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crash_pilot_demo/features/chat/chat_screen.dart';

void main() {
  testWidgets('ChatScreen scrolls to bottom safely without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ChatScreen(),
      ),
    );

    expect(find.byType(ChatScreen), findsOneWidget);
    await tester.pumpAndSettle();
  });
}
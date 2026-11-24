import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crash_pilot_demo/features/chat/chat_screen.dart';

void main() {
  testWidgets('ChatScreen should not crash when _scrollToBottom is invoked', (WidgetTester tester) async {
    // Build the ChatScreen widget within a test environment.
    await tester.pumpWidget(
      const MaterialApp(
        home: ChatScreen(),
      ),
    );

    // Verify the widget is present.
    expect(find.byType(ChatScreen), findsOneWidget);

    // Trigger a frame to ensure any post-frame callbacks or animations are processed.
    // This ensures that even if _scrollToBottom is called, the hasClients check prevents the crash.
    await tester.pumpAndSettle();

    // If no exception was thrown, the test passes.
  });

  testWidgets('ChatScreen should handle disposal gracefully without scroll crashes', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ChatScreen(),
      ),
    );

    // Immediately replace the widget to trigger disposal.
    await tester.pumpWidget(const SizedBox.shrink());
    
    // Ensure no pending timers or scroll animations cause a crash after disposal.
    await tester.pumpAndSettle();
  });
}
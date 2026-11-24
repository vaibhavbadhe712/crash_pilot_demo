import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crash_pilot_demo/features/chat/chat_screen.dart';

void main() {
  testWidgets('ChatScreen _scrollToBottom does not crash when dimensions are not yet available', (WidgetTester tester) async {
    // Build the ChatScreen widget within a standard app structure
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ChatScreen(),
        ),
      ),
    );

    // Trigger a frame to execute postFrameCallbacks.
    // In the crash scenario, the callback runs but the scroll position is not yet ready.
    // The fix ensures that animateTo is only called if hasContentDimensions is true.
    await tester.pump();

    // Verify that no exception was thrown during the frame callback execution
    expect(tester.takeException(), isNull);
  });
}
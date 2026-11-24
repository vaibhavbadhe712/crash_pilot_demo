import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController scrollController = ScrollController();
  final List<String> messages = List.generate(20, (i) => 'Message $i');

  void _scrollToBottom() {
    if (!scrollController.hasClients) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (!scrollController.hasClients) return;
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CrashPilot Demo Chat')),
      body: ListView.builder(
        controller: scrollController,
        itemCount: messages.length,
        itemBuilder: (context, index) => ListTile(title: Text(messages[index])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToBottom,
        child: const Icon(Icons.arrow_downward),
      ),
    );
  }
}

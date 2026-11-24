# CrashPilot Demo App 🚀

A clean, minimal Flutter project designed for testing and demonstrating **CrashPilot** — the autonomous self-healing AI engine for Flutter apps.

## What is Inside:
- `lib/features/chat/chat_screen.dart`: A sample Flutter chat view containing a real-world edge case bug (`_scrollToBottom` with `scrollController.animateTo`).
- `crashpilot.yaml`: CrashPilot configuration with PR-only mode targeting `main`.
- `.github/workflows/crashpilot.yml`: GitHub Actions workflow with manual trace testing and automatic self-healing.

## How to Test in GitHub Actions:
1. Push this project to your GitHub repository (e.g. `vaibhavbadhe712/crash_pilot_demo`).
2. Add your repository secret:
   - **`GEMINI_API_KEY`**: Your Gemini API key from Google AI Studio.
3. Go to **Actions** -> **🚀 CrashPilot — Autonomous Self-Heal** -> **Run workflow**.
4. Paste the crash stack trace:
```text
Null check operator used on a null value #0      ScrollPosition.minScrollExtent (package:flutter/src/widgets/scroll_position.dart:235) #1      ScrollController.animateTo (package:flutter/src/widgets/scroll_controller.dart:223) #2      _ChatScreenState._scrollToBottom (package:crash_pilot_demo/features/chat/chat_screen.dart:18:24)
```
5. Click **Run workflow**!
6. CrashPilot will ingest the crash, analyze the AST of `chat_screen.dart`, write a surgical fix, verify via `flutter analyze` and `flutter test`, and open a Pull Request automatically!

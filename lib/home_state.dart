import 'package:chatbot/controller/chat_controller.dart';
import 'package:flutter/material.dart';

class HomeState extends InheritedWidget {
  const HomeState({
    super.key,
    required this.chatController,
    required super.child,
  });
  final ChatController chatController;

  @override
  bool updateShouldNotify(covariant HomeState oldWidget) {
    return oldWidget.chatController != chatController;
  }

  static ChatController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<HomeState>()!
        .chatController;
  }
}

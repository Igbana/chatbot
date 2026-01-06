import 'package:chatbot/controller/chat_controller.dart';
import 'package:chatbot/home_page.dart';
import 'package:chatbot/home_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeState(chatController: ChatController(), child: HomePage()),
    ),
  );
}

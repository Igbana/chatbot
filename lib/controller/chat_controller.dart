import 'package:chatbot/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatController extends ChangeNotifier {
  List<ChatMessage> chats = [];
  final scrollController = ScrollController();

  void sendMessage(String message) async {
    var client = http.Client();
    chats.add(ChatMessage(isSender: true, message: message));
    notifyListeners();
    try {
      var response = await client.post(
        Uri.parse('http://127.0.0.1:8000/chat'),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode({"message": message}),
      );
      if (response.statusCode != 200) {
        chats.removeLast();
      } else {
        chats.add(ChatMessage.fromJson(jsonDecode(response.body)));
      }
    } catch (e) {
      chats.removeLast();
    } finally {
      client.close();
    }
    notifyListeners();
  }
}

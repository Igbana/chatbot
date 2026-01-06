class ChatMessage {
  const ChatMessage({required this.isSender, required this.message});
  final bool isSender;
  final String message;

  factory ChatMessage.fromJson(Map json) {
    return ChatMessage(isSender: false, message: json["message"]);
  }
}

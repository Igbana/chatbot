import 'package:chatbot/controller/chat_controller.dart';
import 'package:chatbot/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({super.key});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  late TextEditingController messageController;
  late FocusNode msgFocus;
  bool buttonDisabled = true;

  @override
  void initState() {
    messageController = TextEditingController();
    msgFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    msgFocus.dispose();
    super.dispose();
  }

  void send(ChatController c) {
    if (messageController.text.trim().isNotEmpty) {
      c.sendMessage(messageController.text.trim());
      messageController.clear();
      SchedulerBinding.instance.addPostFrameCallback((_) {
        c.scrollController.animateTo(
          c.scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
    msgFocus.requestFocus();
    setState(() {
      buttonDisabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final c = HomeState.of(context);
    return Container(
      padding: .symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Row(
        spacing: 12,
        children: [
          Flexible(
            child: TextField(
              controller: messageController,
              focusNode: msgFocus,
              onSubmitted: (value) => send(c),
              onChanged: (value) => setState(() {
                buttonDisabled = value.trim().isEmpty;
              }),
              decoration: InputDecoration(
                hintText: "Write a message",
                fillColor: Colors.blueGrey,
                border: OutlineInputBorder(borderRadius: .circular(16)),
              ),
            ),
          ),
          IconButton(
            onPressed: buttonDisabled ? null : () => send(c),
            icon: FaIcon(
              FontAwesomeIcons.solidPaperPlane,
              color: buttonDisabled
                  ? Colors.grey
                  : Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

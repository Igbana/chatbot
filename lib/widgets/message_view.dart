import 'package:chatbot/home_state.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/widget/all.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = HomeState.of(context);
    return Expanded(
      child: SingleChildScrollView(
        // reverse: true,
        controller: c.scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListenableBuilder(
            listenable: c,
            builder: (context, child) {
              return Column(
                spacing: 16,
                children: [
                  for (final i in c.chats)
                    Align(
                      alignment: .centerRight,
                      child: Row(
                        textDirection: i.isSender ? .rtl : .ltr,
                        crossAxisAlignment: .end,
                        spacing: 12,
                        children: [
                          i.isSender
                              ? CircleAvatar(
                                  radius: 18,
                                  child: Icon(Icons.person),
                                )
                              : SizedBox(
                                  width: 36,
                                  child: ClipOval(
                                    child: Image.asset('assets/logo.png'),
                                  ),
                                ),
                          Container(
                            padding: .symmetric(vertical: 16, horizontal: 24),
                            decoration: BoxDecoration(
                              color: i.isSender
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: .circular(24),
                                bottomLeft: .circular(24),
                                topRight: .circular(24),
                              ),
                            ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300),
                              child: i.isSender
                                  ? Text(
                                      i.message,
                                      style: TextStyle(
                                        color: i.isSender
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: .w500,
                                      ),
                                    )
                                  : MarkdownWidget(
                                      data: i.message,
                                      shrinkWrap: true,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

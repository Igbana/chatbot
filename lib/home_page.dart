import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bgColor = Colors.grey[300];
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Container(
          width: size.width / 3,
          height: size.height - 100,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: .circular(16),
            boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade700)],
          ),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Header(),
              MessageView(),
              MessageInput(),
            ],
          ),
        ),
      ),
    );
  }
}

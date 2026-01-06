import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Row(
        spacing: 12,
        children: [
          SizedBox(
            width: 48,
            child: ClipOval(child: Image.asset('assets/logo.png')),
          ),
          Text(
            "ChatBot",
            style: TextStyle(fontSize: 18, fontWeight: .w700),
          ),
        ],
      ),
    );
  }
}

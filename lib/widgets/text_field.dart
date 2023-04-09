import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required IconData icon, required String? text}) : _text = text, _icon = icon, super(key: key);

  final IconData _icon;
  final String? _text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          prefixIcon: Icon(_icon),
          border: const UnderlineInputBorder(),
          hintText: _text,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ToggleView extends StatelessWidget {
  const ToggleView({Key? key, required this.onPressed, required this.children, required this.isSelected})
      : super(key: key);
  final Function onPressed;
  final List<Widget> children;
  final List<bool> isSelected;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (index) => onPressed(index),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.red[700],
      selectedColor: Colors.white,
      fillColor: Colors.red[200],
      color: Colors.red[400],
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 80.0,
      ),
      isSelected: isSelected,
      children: children,
    );
  }
}

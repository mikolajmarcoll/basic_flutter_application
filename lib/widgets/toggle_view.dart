import 'package:flutter/material.dart';

class ToggleView extends StatelessWidget {
  const ToggleView({Key? key, required Function onPressed, required List<Widget> children, required List<bool> isSelected})
      : _isSelected = isSelected, _children = children, _onPressed = onPressed, super(key: key);
  final Function _onPressed;
  final List<Widget> _children;
  final List<bool> _isSelected;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (index) => _onPressed(index),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.blue[700],
      selectedColor: Colors.white,
      fillColor: Colors.blue[200],
      color: Colors.blue[400],
      constraints: const BoxConstraints(
        minHeight: 30.0,
        minWidth: 60.0,
      ),
      isSelected: _isSelected,
      children: _children,
    );
  }
}

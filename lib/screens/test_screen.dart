import 'package:flutter/material.dart';

const List<Widget> fruits = <Widget>[Text('Apple'), Text('Banana'), Text('Orange')];

const List<Widget> vegetables = <Widget>[Text('Tomatoes'), Text('Potatoes'), Text('Carrots')];

const List<Widget> icons = <Widget>[
  Icon(Icons.sunny),
  Icon(Icons.cloud),
  Icon(Icons.ac_unit),
];

class TestScreen extends StatefulWidget {
  const TestScreen({super.key, required this.title});

  final String title;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final List<bool> _selectedFruits = <bool>[true, false, false];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ToggleButtons with a single selection.
              Text('Single-select', style: theme.textTheme.titleSmall),
              const SizedBox(height: 5),
              ToggleButtons(
                direction: vertical ? Axis.vertical : Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedFruits.length; i++) {
                      _selectedFruits[i] = i == index;
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.red[700],
                selectedColor: Colors.white,
                fillColor: Colors.red[200],
                color: Colors.red[400],
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: _selectedFruits,
                children: fruits,
              ),
              const SizedBox(height: 20),
              // ToggleButtons with a multiple selection.
              const SizedBox(height: 20),
              // ToggleButtons with icons only.
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            // When the button is pressed, ToggleButtons direction is changed.
            vertical = !vertical;
          });
        },
        icon: const Icon(Icons.screen_rotation_outlined),
        label: Text(vertical ? 'Horizontal' : 'Vertical'),
      ),
    );
  }
}

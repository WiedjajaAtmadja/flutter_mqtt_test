import 'package:flutter/material.dart';

class LedSwitch extends StatelessWidget {
  final String text;
  final bool value;
  final Color color;
  final Function(bool) onChanged;
  const LedSwitch(
      {required this.text,
      required this.value,
      required this.color,
      required this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(text),
      Switch(
        value: value,
        activeColor: color,
        onChanged: onChanged,
      ),
    ]);
  }
}

import 'package:flutter/material.dart';

class TextFieldButton extends StatelessWidget {
  final String hintText;
  final String textButton;
  final TextEditingController textController;
  final VoidCallback onPressed;
  const TextFieldButton(
      {required this.textController,
      required this.onPressed,
      required this.hintText,
      required this.textButton,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: 280,
        child: TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(),
            )),
      ),
      TextButton(onPressed: onPressed, child: Text(textButton))
    ]);
  }
}

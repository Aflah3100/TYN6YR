import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.width,
    required this.height,
    required this.textController,
  });

  final double width;
  final double height;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.72,
      height: height * 0.06,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      color: const Color.fromARGB(255, 222, 220, 220),
      child: Center(
        child: TextFormField(
          controller: textController,
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter Text',
              hintStyle: TextStyle(color: Colors.black, fontSize: 17.0)),
        ),
      ),
    );
  }
}

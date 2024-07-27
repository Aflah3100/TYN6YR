
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.label,
  });

  final double width;
  final double height;
  final void Function() onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.38,
        height: height * 0.05,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(25.0),
            color: const Color.fromARGB(255, 182, 239, 185)),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

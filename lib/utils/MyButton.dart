import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;
  MyButton({super.key, required this.onPressed, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      color: Colors.green,
      onPressed: onPressed,
      child: Text(buttonName),
      
    );
  }
}

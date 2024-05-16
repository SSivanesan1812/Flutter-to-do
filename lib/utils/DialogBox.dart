// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:to_do_app/utils/MyButton.dart";

class DialogBox extends StatelessWidget {
  final VoidCallback add;
  final VoidCallback remove;
  final TextEditingController controller;
  const DialogBox(
      {super.key,
      required this.controller,
      required this.add,
      required this.remove});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyButton(onPressed:add, buttonName: "Add"),
                const SizedBox(
                  width: 15,
                ),
                MyButton(onPressed: remove, buttonName: "Remove")
              ],
            )
          ],
        ),
      ),
    );
  }
}

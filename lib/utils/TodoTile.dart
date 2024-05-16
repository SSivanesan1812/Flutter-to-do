// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class ToDoTile extends StatelessWidget {
  Function(BuildContext)? deleteTask;
  Function(bool?)? onChanged;
  final String tileName;
  final bool checkVal;
  ToDoTile(
      {super.key,
      required this.checkVal,
      required this.onChanged,
      required this.tileName,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
            onPressed: deleteTask,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete')
      ]),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: checkVal,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                tileName,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    decoration: checkVal
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.green),
        ),
      ),
    );
  }
}

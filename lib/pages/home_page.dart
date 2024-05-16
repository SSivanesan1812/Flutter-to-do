// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:to_do_app/utils/DialogBox.dart";
import "package:to_do_app/utils/TodoTile.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final controller=TextEditingController();
  List _toDoList = [
    ["eat", true],
    ["sleep", false]
  ];

  void checkChange(int index) {
    setState(() {
      _toDoList[index][1] = !_toDoList[index][1];
    });
  }

  void addTask(){
    setState(() {
      _toDoList.add([controller.text,false]);
      controller.clear();
      
    });
    Navigator.of(context).pop();
  }

   getTask() {
     showDialog(context: context, builder: (context) => DialogBox(controller: controller,add: addTask,remove: () => Navigator.of(context).pop(),),);
     
  }
   delteTask(int index){
    setState(() {
      _toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: getTask,
            child: Icon(Icons.add),
          ),
          backgroundColor: Colors.green[200],
          appBar: AppBar(
            title: Center(child: Text("To Do List")),
            backgroundColor: Colors.green,
          ),
          body: ListView.builder(
            itemCount: _toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                deleteTask: (p0) => delteTask(index),
                  checkVal: _toDoList[index][1],
                  onChanged: (value) => checkChange(index),
                  tileName: _toDoList[index][0]);
            },
          )),
    );
  }
}

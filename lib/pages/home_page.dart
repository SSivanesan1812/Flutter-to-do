// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:hive/hive.dart";
import "package:to_do_app/database/db.dart";
import "package:to_do_app/utils/DialogBox.dart";
import "package:to_do_app/utils/TodoTile.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final box=Hive.box("ToDoDb");
  ToDoDatabase db= ToDoDatabase();
  final controller=TextEditingController();
  
  @override
  void initState() {
    // TODO: implement initState
    if(box.get("key")==null){
      db.createInit();
    }
    else{
      db.loadData();
    }
    super.initState();
  }
  void checkChange(int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  void addTask(){
    setState(() {
      db.toDoList.add([controller.text,false]);
      controller.clear();
    });
    Navigator.of(context).pop();
        db.updateData();

  }

   getTask() {
     showDialog(context: context, builder: (context) => DialogBox(controller: controller,add: addTask,remove: () => Navigator.of(context).pop(),),);
     
  }
   delteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
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
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                deleteTask: (p0) => delteTask(index),
                  checkVal: db.toDoList[index][1],
                  onChanged: (value) => checkChange(index),
                  tileName: db.toDoList[index][0]);
            },
          )),
    );
  }
}

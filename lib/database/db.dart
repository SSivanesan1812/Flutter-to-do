import 'package:hive/hive.dart';

class ToDoDatabase{
  
  List toDoList = [];
  final box=Hive.box("ToDoDb");
  void createInit(){
    toDoList.addAll([["eat", true],
    ["sleep", false]]);
  }
  void loadData(){
    toDoList=box.get("key");
  }

  void updateData(){
    box.put("key", toDoList);
  }

}
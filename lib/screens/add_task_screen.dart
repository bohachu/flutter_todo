import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);
  String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('增加任務 Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.lightBlueAccent,
                  )),
              TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newText) {
                    print("newText:$newText");
                    newTaskTitle = newText;
                  },
                  style: TextStyle(
                    fontSize: 22,
                  )),
              FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  print('add_task_screen.dart/onPressed/newTaskTitle:$newTaskTitle');
                  addTaskCallback(newTaskTitle);
                },
              ),
            ],
          )),
    );
  }
}

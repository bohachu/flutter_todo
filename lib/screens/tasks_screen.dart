import 'package:flutter/material.dart';
import 'package:state/widgets/tasks_list.dart';
import 'package:state/screens/add_task_screen.dart';
import 'package:state/models/task.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) =>
                    AddTaskScreen((newTaskTitle) {
                      setState(() {
                        print('tasks_screen.dart/newTaskTitle:$newTaskTitle');
                        tasks.add(Task(name: newTaskTitle));
                      });
                      Navigator.pop(context);
                    }));
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  SizedBox(
                    height: 10.0,
                    width: 10.0,
                  ),
                  Text('Todoey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700,
                      )),
                  Text('${tasks.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: TasksList(tasks)),
            )
          ],
        ));
  }
}

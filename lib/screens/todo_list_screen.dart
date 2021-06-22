import 'package:flutter/material.dart';
import 'package:todolist/models/task_model.dart';
import 'package:todolist/screens/add_task_screen.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Task> tasks = [];
  List<Widget> taskWidgets = [];

  void changeStatus(int id, bool status) {
    setState(() {
      tasks = tasks.map((task) {
        if (task.id == id) task.status = status;
        return task;
      }).toList();
    });
  }

  Widget _buildTask(Task task) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.status
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              subtitle: Text(
                "${task.date} • ${task.priority}",
                style: TextStyle(
                  decoration: task.status
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: Checkbox(
                value: task.status,
                onChanged: (status) {
                  if (status == null) status = false;
                  changeStatus(task.id, status);
                },
                activeColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  List<Widget> _displayTaskTiles() {
    return tasks.map((task) => _buildTask(task)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTaskScreen(
                addTask: (Task task, BuildContext ctx) {
                  Navigator.pop(ctx);
                  setState(() {
                    tasks.add(task);
                  });
                },
              ),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 80.0),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 40.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Tasks",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "1 of 10",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Column(children: _displayTaskTiles()),
          ],
        ),
      ),
    );
  }
}

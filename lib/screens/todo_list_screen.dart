import 'package:flutter/material.dart';
import 'package:todolist/models/task_model.dart';
import 'package:todolist/screens/add_task_screen.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  Widget _buildTask(Task task) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(task.title),
              subtitle: Text("${task.date.toString()} • ${task.priority}"),
              trailing: Checkbox(
                value: task.status,
                onChanged: (value) {
                  print(value);
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

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = [];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTaskScreen(
                addTask: (Task task) {
                  print(task);
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
          ],
        ),
      ),
    );
  }
}

// ListView.builder(
//         padding: EdgeInsets.symmetric(vertical: 80.0),
//         physics: BouncingScrollPhysics(),
//         itemCount: tasks.length,
//         itemBuilder: (BuildContext context, int index) {
//           if (index == 0) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 20.0,
//                 horizontal: 40.0,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "My Tasks",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 40.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10.0),
//                   Text(
//                     "1 of 10",
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   )
//                 ],
//               ),
//             );
//           }

//           return _buildTask(tasks[index]);
//         },
//       ),

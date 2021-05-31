import 'package:flutter/material.dart';
import 'package:todolist/screens/todo_list_screen.dart';

void main() {
  runApp(TodoList());
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: TodoListScreen(),
    );
  }
}

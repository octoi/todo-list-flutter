import 'package:localstorage/localstorage.dart';
import 'package:todolist/models/task_model.dart';
import 'dart:convert';

final LocalStorage storage = new LocalStorage("tasks");

saveTasks(List<Task> allTasks) {
  storage.setItem("tasks", json.encode(allTasks));
}

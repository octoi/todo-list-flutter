import 'package:path_provider/path_provider.dart';
import 'package:todolist/models/task_model.dart';
import 'dart:convert';
import 'dart:io';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/tasks.json');
}

Future<File> write(data) async {
  final file = await _localFile;
  return file.writeAsString('{"tasks": $data}');
}

Future<String> read() async {
  try {
    final file = await _localFile;
    final contents = await file.readAsString();
    return contents;
  } catch (e) {
    return "";
  }
}

saveTasks(List<Task> allTasks) async {
  List<String> tasks = allTasks.map((task) => task.toJson()).toList();
  await write(tasks);
}

getTasks() async {
  String contents = await read();
  var data = jsonDecode(contents);
  List rawData = data['tasks'];
  List<Task> returnData = [];

  rawData.forEach((taskString) {
    returnData.add(Task(
      title: taskString['title'],
      date: taskString['date'],
      priority: taskString['priority'],
      status: taskString['status'],
      id: taskString['id'],
    ));
  });

  return returnData;
}

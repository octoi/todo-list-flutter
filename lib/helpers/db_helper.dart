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
  return file.writeAsString('{tasks: $data}');
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
  await write(jsonEncode(allTasks));
  await getTasks();
}

getTasks() async {
  String contents = await read();
  print(contents);
}

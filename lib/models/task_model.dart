class Task {
  String title;
  DateTime date;
  String priority;
  int status; // 0 - incomplete, 1 - complete

  Task({
    required this.title,
    required this.date,
    required this.priority,
    required this.status,
  });
}

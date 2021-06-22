class Task {
  String title;
  String date;
  String priority;
  bool status;
  int id;

  Task({
    required this.title,
    required this.date,
    required this.priority,
    required this.status,
    required this.id,
  });

  String toJson() {
    return '{ "title": "$title", "date": "$date", "priority": "$priority", "status": "$status", "id": "$id" }';
  }
}

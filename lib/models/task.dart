class Task {
  Task({required this.task, required this.dueTime, required this.done});
  String task;
  DateTime dueTime;
  bool done;
  factory Task.fromMap(Map task) {
    return Task(
        task: task["task"], dueTime: task["dueTime"], done: task["done"]);
  }
  Map toMap() {
    return {"task": task, "dueTime": dueTime, "done": done};
  }
}

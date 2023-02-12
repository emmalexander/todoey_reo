import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'task.dart';

class TaskNotifier extends ChangeNotifier {
  final List<Task> _task = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get task {
    return UnmodifiableListView(_task);
  }

  void addTask(String newTask) {
    final task1 = Task(name: newTask);
    _task.add(task1);
    notifyListeners();
  }

  int get taskCount {
    return _task.length;
  }

  void updateTask(Task task) {
    task.toggleIsDone();
    notifyListeners();
  }

  void deleteTask(index) {
    _task.removeAt(index);
    notifyListeners();
  }
}

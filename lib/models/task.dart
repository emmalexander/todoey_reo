import 'package:flutter/cupertino.dart';

class Task extends ChangeNotifier {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleIsDone() {
    isDone = !isDone;
  }
}

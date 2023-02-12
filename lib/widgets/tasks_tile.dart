import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  const TasksTile(
      {required this.taskTitle,
      this.isChecked = false,
      required this.checkboxCallback,
      required this.onLongPressCallback});

  final Function(bool?) checkboxCallback;
  final Function() onLongPressCallback;

  final String taskTitle;

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: onLongPressCallback,
    );
  }
}

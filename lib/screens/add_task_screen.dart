import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_notifier.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;
    return Container(
      decoration: const BoxDecoration(color: Color(0xFF757575)),
      child: Container(
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 50.0,
          right: 50.0,
        ),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: Colors.white),
        child: Column(
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (String value) {
                newTaskTitle = value;
              },
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<TaskNotifier>(context, listen: false)
                      .addTask(newTaskTitle);
                  Navigator.pop(context);
                  //make the button add items to the List task [task.add()]
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                ),
                child: const Text('Add', style: TextStyle(fontSize: 20.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

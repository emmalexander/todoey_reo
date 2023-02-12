import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_notifier.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskNotifier>(
      builder: (context, taskNotifier, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskNotifier.task[index];

            return TasksTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskNotifier.updateTask(task);
                // setState(() {
                //   Provider.of<TaskNotifier>(context).task[index].toggleIsDone();
                // });
              },
              onLongPressCallback: () {
                List<PopupMenuItem> item = [
                  PopupMenuItem(
                    onTap: () {
                      taskNotifier.deleteTask(index);
                    },
                    child: Text('Delete'),
                  )
                ];
                showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    items: item);
              },
            );
          },
          itemCount: taskNotifier.taskCount,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_review7/contoller/main_controller.dart';
import 'package:flutter_review7/widget/task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, TaskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = TaskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback: (checkboxState) {
              TaskData.updateTask(task);
            },
            longPressCallback: () {
              TaskData.deleteTask(task);
            },
          );
        },
        itemCount: TaskData.taskCount,
      );
    });
  }
}

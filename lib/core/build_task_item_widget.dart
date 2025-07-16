
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../controllers/task_controller.dart';
import '../models/task_model.dart';

Widget buildTaskItemWidget(TaskModel task, TaskController taskController) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      // border: Border.all(color: Colors.grey[200]!),
    ),
    child: Row(
      children: [
        // Checkbox
        GestureDetector(
          onTap: () async {

          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: task.isDone ? Colors.green : Colors.grey[400]!,
                width: 1,
              ),
              color: task.isDone? Colors.green : Colors.transparent,
            ),
            child:
                task.isDone
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : null,
          ),
        ),
        const SizedBox(width: 15),
        // Task title and due date
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TextStyle(
                  fontSize: 16,
                  color: task.isDone ? Colors.grey : Colors.black87,
                  decoration:
                      task.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              Text(
                DateFormat('MMM dd').format(task.deadline),
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        // Delete button
         IconButton(
          icon: const Icon(Iconsax.edit, color: Colors.black54),
          onPressed: () async {
            //await taskController.deleteTask(task);
            //setState(() {});
          },
        ),
      
        IconButton(
          icon: const Icon(Iconsax.trash, color: Colors.red),
          onPressed: () async {
           // await taskController.deleteTask(task);
            //setState(() {});
          },
        ),
      ],
    ),
  );
}

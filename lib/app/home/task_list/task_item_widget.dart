import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../core/app_theme.dart';
import '../../core/firebase_utls.dart';
import '../../models/task.dart';
import '../../provider/task_proivder.dart';

// ignore: must_be_immutable
class TaskItem extends StatelessWidget {
  TaskItem({super.key, required this.task});
  Task task;
  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.4,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(20),
              onPressed: (context) {
                // Delete Task
                FirebaseManager.deleteTaskFromFirestore(task)
                    .timeout(const Duration(milliseconds: 1), onTimeout: () {
                  taskProvider.getAllTasks();
                });
              },
              backgroundColor: AppTheme.redColor,
              foregroundColor: AppTheme.whiteColor,
              icon: Icons.delete,
              label: 'Delete Task',
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 2,
              onPressed: (context) {},
              backgroundColor: AppTheme.primaryLight,
              foregroundColor: Colors.white,
              icon: Icons.archive,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          // height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppTheme.whiteColor,
          ),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.075,
                width: 5,
                decoration: BoxDecoration(
                  color: AppTheme.primaryLight,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(task.title ?? 'Null Value',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppTheme.primaryLight)),
                    Text(task.description ?? 'Null Value',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppTheme.primaryDark)),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: AppTheme.primaryLight,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(Icons.check, color: AppTheme.whiteColor, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

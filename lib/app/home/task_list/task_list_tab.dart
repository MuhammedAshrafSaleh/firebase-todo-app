import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/core/app_theme.dart';
import 'package:todo_app/app/providers/auth_manager_provider.dart';
import 'package:todo_app/app/providers/task_proivder.dart';

import 'task_item_widget.dart';

class TaskListTab extends StatelessWidget {
  const TaskListTab({super.key});

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    var authProvider = Provider.of<AuthManagerProvider>(context, listen: false);
    if (taskProvider.taskList.isEmpty) {
      taskProvider.getAllTasks(uId: authProvider.currentUser!.id!);
    }
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: taskProvider.selectedDate,
          // locale: 'ar',
          onDateChange: (selectedDate) {
            taskProvider.changeSelectedDate(
                date: selectedDate, uId: authProvider.currentUser!.id!);
          },
          headerProps: const EasyHeaderProps(
            monthPickerType: MonthPickerType.switcher,
            dateFormatter: DateFormatter.fullDateDMY(),
          ),
          dayProps: EasyDayProps(
            dayStructure: DayStructure.dayStrDayNum,
            // inactive
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: AppTheme.primaryLight),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: taskProvider.taskList.length,
            itemBuilder: (context, index) => TaskItem(
              task: taskProvider.taskList[index],
            ),
          ),
        ),
      ],
    );
  }
}

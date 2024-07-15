import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app/core/app_theme.dart';

import 'task_item_widget.dart';

class TaskListTab extends StatelessWidget {
  const TaskListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          // locale: 'ar',
          onDateChange: (selectedDate) {
            //`selectedDate` the new date selected.
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
        // CalendarTimeline(
        //   initialDate: DateTime.now(),
        //   firstDate: DateTime(1900, DateTime.now().month, DateTime.now().day),
        //   lastDate: DateTime(2100, 11, 20),
        //   onDateSelected: (date) => print(date),
        //   leftMargin: 20,
        //   monthColor: AppTheme.primaryDark,
        //   dayColor: AppTheme.primaryDark,
        //   activeDayColor: AppTheme.whiteColor,
        //   activeBackgroundDayColor: AppTheme.primaryLight,
        //   // selectableDayPredicate: (date) => date.day != 23, // if you need to make a disable day
        //   selectableDayPredicate: (date) => true, // no disable days
        //   locale: 'en_ISO',
        //   dotColor: AppTheme.primaryDark,
        // ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) => const TaskItem()),
        ),
      ],
    );
  }
}

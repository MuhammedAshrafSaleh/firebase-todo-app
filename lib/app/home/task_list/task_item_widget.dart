import 'package:flutter/material.dart';

import '../../core/app_theme.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Task Name', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppTheme.primaryLight)),
                Text('Task Description', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppTheme.primaryDark)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: AppTheme.primaryLight,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.check, color: AppTheme.whiteColor, size: 30),
          ),
        ],
      ),
    );
  }
}

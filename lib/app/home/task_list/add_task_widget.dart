import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/app/widgets/custom_btn.dart';

import '../../widgets/custom_textfield.dart';
import '../../widgets/date_picker.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final dateController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // const SizedBox(height: 20),
            Text(
              'Add New Task :)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 15),
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: titleController,
                    hasIcon: false,
                    text: 'Title',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter task title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    controller: descriptionController,
                    hasIcon: false,
                    text: 'Description',
                    maxlines: 4,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your task description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  DatePickerFormField(
                    controller: dateController,
                    text: 'Task Date',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your task date';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomBtn(text: 'Add Task', onPressed: () {
                    if(formKey.currentState!.validate()){
                      
                    }
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

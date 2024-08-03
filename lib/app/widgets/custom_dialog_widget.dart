import 'package:flutter/material.dart';
import 'package:todo_app/app/core/app_theme.dart';

class DialogUtls {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
      barrierDismissible: false, // to not close the dialog
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: AppTheme.primaryLight),
              const SizedBox(width: 10),
              Text(
                message,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionTitle,
    Function? posActionFucntion,
    String? negActionTitle,
    Function? negActionFucntion,
  }) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            posActionFucntion!.call();
          },
          child: Text(
            posActionTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      );
    }
    if (negActionTitle != null) {
      actions.add(
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            negActionFucntion!.call();
          },
          child: Text(
            negActionTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      );
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: title == null
                ? null
                : Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
            content: Text(
              message,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            // actions: actions,
          );
        });
  }
}

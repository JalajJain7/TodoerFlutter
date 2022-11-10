import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool isChecked ;
  final String taskTitle;
  final Function checkBoxCallback;
  final VoidCallback longPressCallback;
  TaskTile({required this.isChecked, required this.taskTitle,required this.checkBoxCallback,required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress:longPressCallback ,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
      activeColor: Colors.lightBlueAccent,
    value: isChecked,
    // onChanged: toggleChechkboxState,
        onChanged: (newValue){
        checkBoxCallback(newValue);
        },
    ),
    );
  }
}

// (bool? currentCheckBoxState) {
// setState(() {
// isChecked = currentCheckBoxState!;
// });
// }


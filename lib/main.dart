import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_note/models/task_data.dart';
import '/screens/task_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ChangeNotifierProvider<TaskData> build(BuildContext context)  {

    return ChangeNotifierProvider(
      create: (context) { return TaskData(); },
      child: MaterialApp(
        home: TasksScreen(),

      ),
    );
  }
}


import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '/models/task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {

  List<Task> _tasks = [
    Task(name: 'Welcome to Todoey',isDone: false),
    Task(name: 'Click on + to add new Note / ToDo',isDone: false),
    Task(name: 'Long Press any Note to Remove',isDone: false)
  ];
  List<String> items = ['0'];
  List<String> isDones = [];

  void updatingStorageAdd(String newNote,bool isdone)async{
    items[0] = (int.parse(items[0])+1).toString();
    items.add(newNote);
    String isdoneAdd = isdone ? '1':'0' ;
    isDones.add(isdoneAdd);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items', items);
    await prefs.setStringList('isdone', isDones);
  }

  void updatingStorageRemove(String noteText, int index)async{
    items[0] = (int.parse(items[0])-1).toString();
    items.remove(noteText);
    isDones.removeAt(index);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items', items);
    await prefs.setStringList('isdone', isDones);
  }

  void isDonesToggle(index)async{
    if(isDones[index] == '1') {
      isDones[index] = '0';
    } else {
      isDones[index] ='1';
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('isdone', isDones);
  }


  void sharedpref() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('items') != null) {
      _tasks.clear();
      items = prefs.getStringList('items')!;
      isDones = prefs.getStringList('isdone')!;
      int saved = int.parse(items[0]);
      if(saved == 0){
        updatingStorageAdd('Welcome to Todoey',false);
        updatingStorageAdd('Click on + to add new Note / ToDo',false);
        updatingStorageAdd('Long Press any Note to Remove',false);
      }
      for (var i = 1; i <= saved; i++) {
        bool value = isDones[i-1] == '1' ? true : false;
        Task newtask = Task(name: items[i],isDone: value);
        _tasks.add(newtask);
      }

    } else {
      updatingStorageAdd('Welcome to Todoey',false);
      updatingStorageAdd('Click on + to add new Note / ToDo',false);
      updatingStorageAdd('Long Press any Note to Remove',false);
    }
    notifyListeners();
  }

  TaskData() {
    sharedpref();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) async {
    final task = Task(name: newTaskTitle);
    updatingStorageAdd(newTaskTitle,false);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    int index = _tasks.indexOf(task);
    isDonesToggle(index);
    notifyListeners();
  }

  void deleteTask(Task task) {
    int index = _tasks.indexOf(task);
    _tasks.remove(task);
    notifyListeners();
    updatingStorageRemove(task.name,index);
  }
}

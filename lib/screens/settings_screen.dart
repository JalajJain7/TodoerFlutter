import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_note/models/task_data.dart';
import 'package:todoey_note/screens/add_task_screen.dart';
import '/widgets/tasks_list.dart';
import './settings_screen.dart';

class settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding:
            const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                Center(
                  child: Text(
                    'Settings',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                // alignment: Alignment.topRight,

                padding:  EdgeInsets.symmetric(horizontal: 45 ,vertical: 20),
                // width: double.infinity,
                decoration: const BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.share,
                          color: Colors.lightBlueAccent,

                          ),
                          SizedBox(width: 10,),
                          Text('Share With Friends'),
                          SizedBox(width: 50,),
                          Icon(Icons.navigate_next)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



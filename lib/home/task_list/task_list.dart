import 'package:flutter/material.dart';
import 'package:todo/model/task.dart';
import 'package:todo/utls.firebase.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  String title = '';
  String description = '';
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.all(18),
          child: Text(
            'Add New Task',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'enter your task',
              ),
              onChanged: (text) {
                title = text;
              },
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please Enter Your title';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'enter your descrebtion',
              ),
              onChanged: (text) {
                description = text;
              },
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please Enter Your description'; // not valid
                }
                return null; // valid
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Select time',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                chosenDate();
              },
              child: Text(
                '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  addTask();
                },
                child: Text(
                  'Add',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ]
          ),

        ),

      ]),
    );
  }

  void chosenDate() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      Task task = Task(
          title: title,
          description: description,
          date: selectedDate.millisecondsSinceEpoch);
      addTaskToFire(task).timeout(Duration(milliseconds: 500),onTimeout:(){
        print('finished');
        Navigator.pop(context);
        setState(() {

        });
      });
    }
  }

}

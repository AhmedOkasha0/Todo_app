import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task.dart';
import 'package:todo/providers/settings_provider.dart';

class EditTask extends StatefulWidget {
  static const String routeName = 'editTask';

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var formkey = GlobalKey<FormState>();
  late Task task;
  DateTime selectedDate = DateTime.now();
  String title = '';
  String description = '';
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var task = ModalRoute.of(context)?.settings.arguments as Task;
      titleController.text = task.title;
      descriptionController.text = task.description;
      selectedDate = DateTime.fromMillisecondsSinceEpoch(task.date);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: screenSize.height * 0.7,
                width: screenSize.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Text(
                            'Add New Task',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        Form(
                          key: formkey,
                          child: Column(children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'enter your task',
                              ),
                              controller: titleController,
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
                              controller: descriptionController,
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
                                  if (formkey.currentState!.validate()) {
                                    task.title = titleController.text;
                                    task.description =
                                        descriptionController.text;
                                    task.date =
                                        selectedDate.millisecondsSinceEpoch;
                                    Provider.of<SettingsProvider>(
                                      context,
                                      listen: false,
                                    ).editTaskInProvider(task);
                                  }
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Save Changes',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
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
    if (formkey.currentState?.validate() == true) {
      Task task = Task(
          title: title,
          description: description,
          date: selectedDate.millisecondsSinceEpoch);
    }
  }
}

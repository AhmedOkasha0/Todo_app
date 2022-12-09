import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/home/menu/item_task.dart';
import 'package:todo/model/task.dart';
import 'package:todo/utls.firebase.dart';


class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<Task>taskList=[];
  DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
      getAllTasksFromFireStore();
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date)  {
              selectedDate=date;
              setState(() {

              });

            },

            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: Colors.teal[200],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Theme.of(context).primaryColor,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(itemBuilder:(context,index){
              return ItemTaskWidget(task: taskList[index],);
            },
              itemCount: taskList.length,
            ),
          ),
        ],
      ),
    );
  }

  void getAllTasksFromFireStore()async{
    QuerySnapshot<Task> querySnapShot= await getTaskCollection().get();
    taskList=querySnapShot.docs.map((doc){
      return doc.data();
    }).toList();
    
    
    taskList=taskList.where((task){
      DateTime dateTime=DateTime.fromMicrosecondsSinceEpoch(task.date);
      if(dateTime.year == selectedDate.year &&
      dateTime.month == selectedDate.month&&
      dateTime.day == selectedDate.day){
        return true;
      }
      return false;
    }).toList();

    taskList.sort((Task task1, Task task2){
      DateTime dateTime1=DateTime.fromMicrosecondsSinceEpoch(task1.date);
      DateTime dateTime2=DateTime.fromMicrosecondsSinceEpoch(task2.date);
      return dateTime1.compareTo(dateTime2);


    });


    setState(() {

    });
   
  }
  

}

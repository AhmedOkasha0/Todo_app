import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/model/task.dart';
import 'package:todo/utls.firebase.dart';

class ItemTaskWidget extends StatelessWidget {
  Task task;
  ItemTaskWidget({required this.task});
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Slidable(// Specify a key if the Slidable is dismissible.
        key: const ValueKey(0),

        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          extentRatio: 0.3,
          // All actions are defined in the children parameter.
          children:  [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context){
                deletTaskFromFireStore(task).timeout(Duration(microseconds: 5),onTimeout: (){
                  print('task was deleted successfully');
                });

              },
              backgroundColor: Color(0xFFFE4A49),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),

          ],
        ),
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 5,
                color: Theme.of(context).primaryColor,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      '(${task.title}).',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text('${task.description}',style: Theme.of(context).textTheme.subtitle2),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor
                ),
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                child: Icon(Icons.check,size: 30,color: Colors.white,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

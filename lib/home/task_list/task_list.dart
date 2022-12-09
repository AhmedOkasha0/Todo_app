import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
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
        Column(children: [
          Form(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'enter your task',
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'enter your descrebtion',
            ),
          ),
        ]),
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
          onTap: (){},
          child: Text(
            '12/12/2020',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Add',style: Theme.of(context).textTheme.subtitle1,),
        ),
      ]),
    );
  }
}

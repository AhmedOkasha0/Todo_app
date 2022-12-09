import 'package:flutter/material.dart';

class ItemTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
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
                    'Play basket ball',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text('Description',style: Theme.of(context).textTheme.subtitle2),
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
    );
  }
}

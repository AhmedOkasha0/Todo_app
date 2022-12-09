import 'package:flutter/material.dart';

class LanguageSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'English',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                Icon(
                  Icons.check,
                  size: 25,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Arabic',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

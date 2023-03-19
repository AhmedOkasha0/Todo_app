import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/settings_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changTheme(ThemeMode.light);
                setState(() {});
              },
              child: getselectedWidget('light')),
          InkWell(
            onTap: () {
              settingsProvider.changTheme(ThemeMode.dark);
              setState(() {

              });
            },
            child: getUnselectedWidget('dark'),
          )
        ],
      ),
    );
  }

  Widget getselectedWidget(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Light',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Icon(
          Icons.check,
          size: 25,
        ),
      ],
    );
  }

  Widget getUnselectedWidget(String title) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Dark',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ],
    );
  }
}

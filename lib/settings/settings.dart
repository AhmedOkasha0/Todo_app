import 'package:flutter/material.dart';
import 'package:todo/settings/language_bottom_sheet.dart';
import 'package:todo/settings/theme_bottom-sheet.dart';

class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.all(20)),
          Text('Language', style: Theme
              .of(context)
              .textTheme
              .subtitle2,),
          SizedBox(height: 10,),
          InkWell(
            onTap: languageTheme,
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text('English', style: Theme
                  .of(context)
                  .textTheme
                  .subtitle2,),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text('Theme', style: Theme
              .of(context)
              .textTheme
              .subtitle2,),
          SizedBox(height: 10,),
          InkWell(
            onTap: showThemeBottomSheet,
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text('Light', style: Theme
                  .of(context)
                  .textTheme
                  .subtitle2,),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white
              ),
            ),
          ),

        ],
      ),


    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (buildContext) {
          return ThemeBottomSheet();
        }
    );
  }

  void languageTheme() {
    showModalBottomSheet(context: context,
        builder: (buildContext) {
          return LanguageSheet();
        }
    );
  }
}

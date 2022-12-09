import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/home/home_screen.dart';
import 'package:todo/providers/settings_provider.dart';
import 'package:todo/theme_app.dart';

void main(){
  runApp(ChangeNotifierProvider(create: (BuildContext)=>SettingsProvider(),
      child: MyApp()));

}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var settingsProvider=Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName ,
      routes:{
        HomeScreen.routeName:(context)=>HomeScreen(),
      } ,
      theme: ThemeScreen.lightTheme,
      darkTheme:ThemeScreen.DarkTheme,
      themeMode: settingsProvider.currentMode,


    );
  }
}

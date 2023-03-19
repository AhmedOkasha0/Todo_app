import 'package:flutter/material.dart';
import 'package:todo/home/menu/menu.dart';
import 'package:todo/home/task_list/task_list.dart';
import 'package:todo/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {
              print(index);
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/Icon_settings.png',
                  ),
                ),
                label: 'settings'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/Icon awesome-list.png',
                  ),
                ),
                label: 'Menu'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 4,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          showButtomSheet();
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [Settings(), Menu()];
  void showButtomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return TaskList();
        });
  }
}

import 'package:flutter/material.dart';
import 'package:geodata/ui/styles/ui_helpers.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function onTap;
  final int selectedIndex;

  const CustomBottomNavigationBar({this.onTap, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (int index) {
          onTap(index);
        },
        elevation: 0,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: UIHelper.hexToColor('#1462f8'),
        unselectedItemColor: UIHelper.hexToColor('#787993'),
        backgroundColor: Colors.white,
        unselectedIconTheme:
            IconThemeData(color: UIHelper.hexToColor('#787993'), size: 28.0),
        selectedIconTheme:
            IconThemeData(color: UIHelper.hexToColor('#1462f8'), size: 28.0),
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: UIHelper.hexToColor('#787993'),
            fontSize: 15.0),
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            title: Padding(
                padding: EdgeInsets.only(top: 5.0), child: Text('Messages')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.donut_large),
            title: Padding(
                padding: EdgeInsets.only(top: 6.0), child: Text('Home')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Padding(
                padding: EdgeInsets.only(top: 6.0), child: Text('Services')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Padding(
                padding: EdgeInsets.only(top: 6.0), child: Text('Calendar')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.center_focus_weak),
            title: Padding(
                padding: EdgeInsets.only(top: 6.0), child: Text('Settings')),
          ),
        ]);
  }
}

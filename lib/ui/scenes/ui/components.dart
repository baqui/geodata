import 'package:flutter/material.dart';
import 'package:geodata/ui/styles/ui_helpers.dart';

import 'package:geodata/ui/scenes/ui/messages.dart';
import 'package:geodata/ui/scenes/ui/home.dart';
import 'package:geodata/ui/scenes/ui/services.dart';
import 'package:geodata/ui/scenes/ui/calendar.dart';
import 'package:geodata/ui/scenes/ui/settings.dart';


class UiComponentsView extends StatefulWidget {
  UiComponentsView({Key key}) : super(key: key);

  @override
  _UiComponentsViewState createState() => _UiComponentsViewState();
}

class _UiComponentsViewState extends State<UiComponentsView> {
  int _selectedIndex = 3;
  final controller = PageController(
    initialPage: 3,
  );
  var scrollDirection = Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller,
        scrollDirection: scrollDirection,
        onPageChanged: (int page) {
          setState(() { _selectedIndex = page;});
        },
        ///Enable physics property to provide your PageView with a
        ///custom scroll behaviour
        ///Here BouncingScrollPhysics will pull back the boundary
        ///item (first or last) if the user tries to scroll further.
        //physics: BouncingScrollPhysics(),
        pageSnapping: true,
        children: <Widget>[
          Messages(),
          Home(),
          Services(),
          Calendar(),
          Settings()
        ]
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          //border: Border(top: BorderSide(color: Colors.black, width: 3.0,))
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(171, 180, 189, 0.3),
              blurRadius: 20.0,
              spreadRadius: 5.0,
              offset: Offset( 0, 0 ),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomNavigationBar(
            onTap: (int index) { 
              setState(() { _selectedIndex = index;});
              controller.jumpToPage(index);
            },
            elevation: 0,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: UIHelper.hexToColor('#1462f8'),
            unselectedItemColor: UIHelper.hexToColor('#787993'),
            backgroundColor: Colors.white,
            unselectedIconTheme: IconThemeData(
              color: UIHelper.hexToColor('#787993'),
              size: 28.0
            ),
            selectedIconTheme: IconThemeData(
              color: UIHelper.hexToColor('#1462f8'),
              size: 28.0
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: UIHelper.hexToColor('#787993'),
              fontSize: 15.0
            ),
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.0
            ),
            currentIndex: _selectedIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline),
                title: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text('Messages')
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.donut_large),
                title: Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text('Home')
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                title: Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text('Services')
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                title: Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text('Calendar')
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.center_focus_weak),
                title: Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text('Settings')
                ),
              ),
            ]
      ),
        ),
      ),
    );
  }
}
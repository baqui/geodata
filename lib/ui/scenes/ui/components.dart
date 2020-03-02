import 'package:flutter/material.dart';
import 'package:geodata/ui/styles/ui_helpers.dart';

import 'package:geodata/ui/scenes/ui/messages.dart';
import 'package:geodata/ui/scenes/ui/home.dart';
import 'package:geodata/ui/scenes/ui/services.dart';
import 'package:geodata/ui/scenes/ui/calendar.dart';
import 'package:geodata/ui/scenes/ui/settings.dart';
import 'package:geodata/ui/widgets/custom_bottom_navigation_bar.dart';

class UiComponentsView extends StatefulWidget {
  UiComponentsView({Key key}) : super(key: key);

  @override
  _UiComponentsViewState createState() => _UiComponentsViewState();
}

class _UiComponentsViewState extends State<UiComponentsView> {
  int _selectedIndex = 0;
  final controller = PageController(
    initialPage: 0,
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
          child: CustomBottomNavigationBar(
            onTap: (int index) {
              setState(() { _selectedIndex = index;});
              controller.jumpToPage(index);
            },
            selectedIndex: _selectedIndex
          )
        ),
      ),
    );
  }
}
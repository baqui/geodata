import 'package:flutter/material.dart';
import 'package:geodata/locator.dart';
import 'package:geodata/ui/router.dart';

void main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My habbits',
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            dialogBackgroundColor: Colors.red,
            canvasColor: Colors.transparent),
        initialRoute: 'ui_components',
        onGenerateRoute: Router.generateRoute,
        debugShowCheckedModeBanner: false);
  }
}

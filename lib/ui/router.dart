import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geodata/ui/scenes/initial.dart';
import 'package:geodata/ui/scenes/ui/components.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'initial':
        return MaterialPageRoute(builder: (_) => InitialView());
      case 'ui_components':
        return MaterialPageRoute(builder: (_) => UiComponentsView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

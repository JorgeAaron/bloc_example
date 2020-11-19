import 'package:flutter/material.dart';
import 'package:flutterblocdemo/segunda.dart';
import 'main.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());

      case '/second':
        // Validation of correct data type
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => SegundaPantalla(),
          );
        }
        return _errorRoute();
      
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
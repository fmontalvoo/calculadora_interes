import 'package:flutter/material.dart';

import 'package:ic_app/src/ic/ui/screens/ic_screen.dart';

class AppRoutes {
  static const String HOME = 'home';

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      HOME: (BuildContext context) => ICScreen(),
    };
  }
}

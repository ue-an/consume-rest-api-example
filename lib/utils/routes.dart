import 'package:consume_rest_api_app/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  Routes._();
  static const String profile = '/profile';

  static final routes = <String, WidgetBuilder>{
    profile: (context) => ProfileScreen(),
  };
}

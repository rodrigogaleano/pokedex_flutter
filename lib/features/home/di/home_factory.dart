import 'package:flutter/material.dart';

import '../home_view_controller.dart';

class HomeFactory {
  static const String homeRoute = '/home';

  static StatefulWidget home() {
    return const HomeViewController();
  }
}

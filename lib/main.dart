import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/view/home_screen.dart';
import 'Screens/view/location_screen.dart';

void main() {
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (p0) => GoogleScreen(),
          'locate' : (p0) => TrakeScreen(),
        },
      )
  );
}
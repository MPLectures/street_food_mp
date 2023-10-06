import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:street_food_mp/views/screens/screen_on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenOnBoarding(),
      ),
    );
  }
}

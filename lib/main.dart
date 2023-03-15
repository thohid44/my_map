import 'package:flutter/material.dart';

import 'googleMap/location_tracking.dart';
import 'pages/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Map ',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: LocationTracking(),
    );
  }
}

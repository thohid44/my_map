import 'package:flutter/material.dart';
import 'package:my_map/stact_image.dart';

import 'googleMap/location_tracking.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Map',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: LocationTracking(),
    );
  }
}

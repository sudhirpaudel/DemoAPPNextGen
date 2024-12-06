import 'package:flutter/material.dart';
import 'package:smapp/config/colors.dart';
import 'package:smapp/screens/dashboard_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Management APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor:primaryColor ),
        useMaterial3: true,
      ),
      home: const DashboardPage()
    );
  }
}

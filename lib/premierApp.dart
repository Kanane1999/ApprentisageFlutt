import 'package:flutter/material.dart';

import 'appview.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Quicksand"),
      home: const AccueilPage(),
    );
  }
}

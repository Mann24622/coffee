import 'package:coffee/ui/firstpage.dart';
import 'package:coffee/ui/second.dart';
import 'package:coffee/ui/third.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute:  Firstpage.routeName,
      theme: ThemeData(

        useMaterial3: true,
      ),
        routes: {
        Firstpage.routeName: (context) => Firstpage(),
          Second.routeName: (context) => Second(),
          Third.routeName: (context) => Third()
        },
    );
  }
}



import 'package:fabcurate/util.dart/provider.dart';
import 'package:fabcurate/util.dart/roots.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider()),
      ChangeNotifierProvider<ModulDataProvider>(
          create: (_) => ModulDataProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fabcurate',
      home: MyHomepage(),
    );
  }
}

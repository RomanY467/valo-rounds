import 'package:flutter/material.dart';
import 'package:valo/src/gs/valo_sheets.dart';
import 'package:valo/src/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  await SheetsApi.init();
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ValoRound',
        home: HomePage());
  }
}

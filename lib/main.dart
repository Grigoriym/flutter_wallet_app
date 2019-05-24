import 'package:flutter/material.dart';
import 'bottom_navigation_holder.dart';
import 'utils/FieldConstants.dart';

void main() => runApp(FlutterWalletApp());

class FlutterWalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FieldConstants.APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: FieldConstants.APP_TITLE),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/ui/bottom_navigation_holder.dart';
import 'utils/field_constants.dart';

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
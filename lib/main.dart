import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/ui/bottom_navigation/bottom_navigation_holder.dart';
import 'package:flutter_wallet_app/src/utils/field_constants.dart';

void main() => runApp(FlutterWalletApp());

class FlutterWalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: FieldConstants.APP_TITLE,
            theme: CupertinoThemeData(
              primaryColor: Color(0xFFFF2D55),
            ),
            home: BottomNavigationHolder(
              title: FieldConstants.APP_TITLE,
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            title: FieldConstants.APP_TITLE,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: BottomNavigationHolder(
              title: FieldConstants.APP_TITLE,
            ),
          );
  }
}

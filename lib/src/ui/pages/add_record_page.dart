import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/ui/pages/record_view_pager/details_page_view_page.dart';
import 'package:flutter_wallet_app/src/ui/pages/record_view_pager/main_page_view_page.dart';

class AddRecordPage extends StatefulWidget {
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecordPage> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          MainPageViewPage(),
          DetailsPageViewPage(),
        ],
      ),
    );
  }
}
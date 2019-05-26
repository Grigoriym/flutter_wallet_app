import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/models/ui/record_details_model.dart';
import 'package:flutter_wallet_app/src/ui/custom_widgets/list_view_item.dart';
import 'package:flutter_wallet_app/src/ui/pages/add_record_page.dart';
import 'package:flutter_wallet_app/src/ui/botton_navigation/bottom_navigation_holder.dart';

class AddRecordOneCategory extends StatefulWidget {
  _AddRecordOneCategoryState createState() => _AddRecordOneCategoryState();
}

class _AddRecordOneCategoryState extends State<AddRecordOneCategory> {
  List<RecordDetailsModel> items = [
    RecordDetailsModel(iconData: Icons.touch_app, mainText: "Groceries"),
    RecordDetailsModel(
        iconData: Icons.access_alarm, mainText: "Restaurant, fast-food"),
    RecordDetailsModel(iconData: Icons.add_location, mainText: "Bar, cafe"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose category"),
        centerTitle: true,
      ),
      body: ListViewItem(
        items: items,
        goToWidgetOnClick: BottomNavigationHolder(),
      ),
    );
  }
}

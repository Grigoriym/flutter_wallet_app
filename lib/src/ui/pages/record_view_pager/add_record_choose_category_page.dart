import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/models/ui/record_details_model.dart';
import 'package:flutter_wallet_app/src/ui/custom_widgets/list_view_item.dart';

import 'add_record_one_category_page.dart';

class AddRecordChooseCategoryPage extends StatefulWidget {
  _AddRecordChooseCategoryPageState createState() =>
      _AddRecordChooseCategoryPageState();
}

class _AddRecordChooseCategoryPageState
    extends State<AddRecordChooseCategoryPage> {
  List<RecordDetailsModel> items = [
    RecordDetailsModel(iconData: Icons.fastfood, mainText: "Food \& Drinks"),
    RecordDetailsModel(iconData: Icons.shopping_cart, mainText: "Shopping"),
    RecordDetailsModel(iconData: Icons.home, mainText: "Housing"),
    RecordDetailsModel(
        iconData: Icons.directions_transit, mainText: "Transportation"),
    RecordDetailsModel(iconData: Icons.directions_car, mainText: "Vehicle"),
    RecordDetailsModel(
        iconData: Icons.people, mainText: "Life \& Entertainment"),
    RecordDetailsModel(iconData: Icons.computer, mainText: "Communication, PC"),
    RecordDetailsModel(
        iconData: Icons.attach_money, mainText: "Financial Expenses"),
    RecordDetailsModel(iconData: Icons.touch_app, mainText: "Investments"),
    RecordDetailsModel(iconData: Icons.copyright, mainText: "Icnome"),
    RecordDetailsModel(iconData: Icons.menu, mainText: "Others"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categories"),
      ),
      body: ListViewItem(
        items: items,
        goToWidgetOnClick: AddRecordOneCategory(),
      ),
    );
  }
}

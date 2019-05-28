import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/models/ui/record_details_model.dart';
import 'package:flutter_wallet_app/src/ui/custom_widgets/list_view_item.dart';

class DetailsPageViewPage extends StatefulWidget {
  _DetailsPageViewPageState createState() => _DetailsPageViewPageState();
}

class _DetailsPageViewPageState extends State<DetailsPageViewPage> {
  List<RecordDetailsModel> items = [
    RecordDetailsModel(iconData: Icons.label, mainText: "Labels"),
    RecordDetailsModel(iconData: Icons.payment, mainText: "Payment type"),
    RecordDetailsModel(iconData: Icons.label, mainText: "Status"),
    RecordDetailsModel(iconData: Icons.date_range, mainText: "Date"),
    RecordDetailsModel(iconData: Icons.watch, mainText: "Time"),
    RecordDetailsModel(iconData: Icons.label, mainText: "Warranty"),
    RecordDetailsModel(iconData: Icons.person, mainText: "Payee"),
    RecordDetailsModel(iconData: Icons.pin_drop, mainText: "Add location"),
    RecordDetailsModel(iconData: Icons.photo_camera, mainText: "Attach photo"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Platform.isAndroid
            ? TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Details",
                ),
              )
            : CupertinoTextField(
                placeholder: "Details",
              ),
        Flexible(
          child: ListViewItem(
            items: items,
          ),
        ),
      ],
    );
  }
}

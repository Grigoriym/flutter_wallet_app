import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/models/ui/record_details_model.dart';

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
        TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Details",
          ),
        ),
        MyListView(),
      ],
    );
  }

  Widget MyListView() {
    return Flexible(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, position) {
          return InkWell(
            onTap: () {},
            child:
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Icon(items[position].iconData),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(items[position].mainText),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 9,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../models/record_model.dart';

class AccountsPage extends StatefulWidget {
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  var list = [
    RecordModel("!23", "123", "!234", "6:56AM", "Dgdfg", "Dfgdfg", 1813,
        "g35hg5egfg", "General - Food'n Drinks"),
    RecordModel("123fsdfsd", "h5h", "!23465j4", "10:01AM", "Dgdfg", "Dfgdfg",
        180, "VVVVVV", "Health care, doctor"),
    RecordModel("!sdfsdf", "5h5", "!234", "09:00AM", "Dgdfg", "Dfgdfg", 630,
        "ym68j4j4", "Books, audio"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, position) {
          final item = list[position];
          return CardView(
              category: item.category, sum: item.sum, time: item.time);
        },
        itemCount: list.length,
      ),
    );
  }
}

class CardView extends StatelessWidget {
  CardView({this.category, this.sum, this.time});

  final String category;
  final double sum;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        children: <Widget>[
          Center(
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1557562440-b67d58679232?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"))),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(category),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.only(top: 8, end: 8),
                child: Text(sum.toString()),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 8, end: 8),
                child: Text(time),
              ),
            ],
          )
        ],
      ),
    );
  }
}

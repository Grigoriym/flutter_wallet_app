import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/ui/statistics_model.dart';

class StatisticsPage extends StatefulWidget {
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage>
    with TickerProviderStateMixin {
  List<StatisticsModel> items = [
    StatisticsModel(text: "Reports", iconData: Icons.receipt),
    StatisticsModel(text: "Income & Expenses", iconData: Icons.receipt),
    StatisticsModel(text: "Categories", iconData: Icons.receipt),
    StatisticsModel(text: "Balance", iconData: Icons.receipt),
    StatisticsModel(text: "Labels", iconData: Icons.receipt),
    StatisticsModel(text: "Records", iconData: Icons.receipt)
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, position) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2.0,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "${items[position].text}",
              ),
            ),
          ),
        );
      },
    );
  }
}

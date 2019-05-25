import 'package:flutter/material.dart';

class MainPageViewPage extends StatefulWidget {
  _MainPageViewPageState createState() => _MainPageViewPageState();
}

class _MainPageViewPageState extends State<MainPageViewPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          tabs: [
            Tab(
              text: "Expense",
            ),
            Tab(
              text: "Income",
            ),
            Tab(
              text: "Transfer",
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.redAccent,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.amberAccent,
            ),
          ),
        ],
      ),
    );
  }
}

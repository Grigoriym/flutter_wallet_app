import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/ui/pages/accounts_page.dart';
import 'package:flutter_wallet_app/src/ui/pages/add_record_page.dart';
import 'package:flutter_wallet_app/src/ui/pages/more_page.dart';
import 'package:flutter_wallet_app/src/ui/pages/statistics_page.dart';
import 'package:flutter_wallet_app/src/ui/pages/wallet_now_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: Material(
        color: Colors.green,
        child: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.account_balance_wallet),
            ),
            Tab(
              icon: Icon(Icons.credit_card),
            ),
            Tab(
              icon: Icon(Icons.add),
            ),
            Tab(
              icon: Icon(Icons.score),
            ),
            Tab(
              icon: Icon(Icons.more_horiz),
            ),
          ],
          controller: tabController,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          AccountsPage(),
          WalletNowPage(),
          AddRecordPage(),
          StatisticsPage(),
          MorePage(),
        ],
        controller: tabController,
      ),
    );
  }
}

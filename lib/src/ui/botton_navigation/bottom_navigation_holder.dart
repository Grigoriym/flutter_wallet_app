import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/ui/pages/accounts_page.dart';
import 'package:flutter_wallet_app/src/ui/pages/add_record_page.dart';
import 'package:flutter_wallet_app/src/ui/pages/more_page.dart';
import 'package:flutter_wallet_app/src/ui/pages/statistics_page.dart';
import 'package:flutter_wallet_app/src/ui/pages/wallet_now_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final List<MyTabs> _tabs = [
    MyTabs(title: "Accounts"),
    MyTabs(title: "Wallet Now"),
    MyTabs(title: "Add Record"),
    MyTabs(title: "Statistics"),
    MyTabs(title: "More"),
  ];
  MyTabs _myHandler;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _myHandler = _tabs[0];
    _tabController.addListener(_handleSelected);
  }

  void _handleSelected() {
    setState(() {
      _myHandler = _tabs[_tabController.index];
    });
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
        title: Text(_myHandler.title),
      ),
      bottomNavigationBar: Material(
        color: Colors.green,
        child: TabBar(tabs: <Widget>[
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
        ], controller: _tabController),
      ),
      body: TabBarView(
        children: <Widget>[
          AccountsPage(),
          WalletNowPage(),
          AddRecordPage(),
          StatisticsPage(),
          MorePage(),
        ],
        controller: _tabController,
      ),
    );
  }
}

class MyTabs {
  final String title;

  MyTabs({this.title});
}

enum AppBarTitles { Accounts, WalletNow, AddRecord, Statistics, More }

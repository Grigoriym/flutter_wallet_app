import 'package:flutter/material.dart';
import 'add_record_choose_category_page.dart';
import 'package:flutter_wallet_app/src/models/record_model.dart';
import 'package:flutter_wallet_app/src/db/db_helper.dart';

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

  Widget expensesWidget() {
    return generalWidgetForTabViews(0);
  }

  Widget incomeWidget() {
    return generalWidgetForTabViews(1);
  }

  Widget transferWidget() {
    return generalWidgetForTabViews(2);
  }

  Widget generalWidgetForTabViews(int tabPosition) {
    final dbHelper = DbHelper.instance;

    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddRecordChooseCategoryPage(),
                      ),
                    );
                  },
                  child: FutureBuilder<List<RecordModel>>(
                    future: dbHelper.getRecords(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      return Icon(Icons.account_balance);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
            child: TabBarView(
              children: <Widget>[
                expensesWidget(),
                incomeWidget(),
                transferWidget(),
              ],
              controller: _tabController,
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

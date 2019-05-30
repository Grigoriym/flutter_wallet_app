import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/blocs/currency_bloc.dart';
import 'package:flutter_wallet_app/src/models/currency_model.dart';
import 'package:flutter_wallet_app/src/blocs/currency_list_bloc.dart';
import 'package:flutter_wallet_app/src/models/currency/currency_list_model.dart';

class WalletNowPage extends StatefulWidget {
  _WalletNowPageState createState() => _WalletNowPageState();
}

class _WalletNowPageState extends State<WalletNowPage> {
  var _firstDropDown;
  var _secondDropDown;

  @override
  void initState() {
    super.initState();
    listBloc.fetchListOfCurrencies();
    bloc.fetchCurrencies("USD", "KZT");
  }

  @override
  void dispose() {
    listBloc.dispose();
    bloc.dispose();
    super.dispose();
  }

  Widget buildRow(List<CurrencyListModel> listOfItems) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
//              items: [
//                DropdownMenuItem(
//                  value: '1',
//                  child: Text('First'),
//                ),
//              ],
              isDense: true,
              hint: Text("From"),
              items: listOfItems.map(
                (CurrencyListModel model) {
                  return DropdownMenuItem(
                    value: model.id,
                    child: Text(model.currencyName),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  _firstDropDown = value;
                });
              },
              value: _firstDropDown,
            ),
          ),
        ),
        Spacer(),
        Flexible(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              items: [
                DropdownMenuItem(
                  value: '1',
                  child: Text('First'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _secondDropDown = value;
                });
              },
              value: _secondDropDown,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: listBloc.listOfCurrencies,
              builder: (
                context,
                AsyncSnapshot<List<CurrencyListModel>> snapshot,
              ) {
                if (snapshot.hasData) {
                  return buildRow(snapshot.data);
                } else {
                  return Container();
                }
              },
            ),
            RaisedButton(
              onPressed: () {},
            ),
            StreamBuilder(
              stream: bloc.currencies,
              builder: (
                context,
                AsyncSnapshot<CurrencyModel> snapshot,
              ) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data.first} ${snapshot.data.second}");
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error.toString()}");
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/src/blocs/currency_bloc.dart';
import 'package:flutter_wallet_app/src/models/curerncy_model.dart';

class WalletNowPage extends StatefulWidget {
  _WalletNowPageState createState() => _WalletNowPageState();
}

class _WalletNowPageState extends State<WalletNowPage> {
  @override
  void initState() {
    super.initState();
    bloc.fetchCurrencies("USD", "KZT");
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.currencies,
        builder: (
          context,
          AsyncSnapshot<CurrencyModel> snapshot,
        ) {
          if (snapshot.hasData) {
            return Text("${snapshot.data.first} ${snapshot.data.second}");
          } else if (snapshot.hasError) {
            return Text("${snapshot.error.toString()}");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

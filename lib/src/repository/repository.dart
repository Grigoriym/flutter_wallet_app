import 'dart:async';

import 'package:flutter_wallet_app/src/models/curerncy_model.dart';
import 'package:flutter_wallet_app/src/network/currency_api_provider.dart';

class Repository {
  final currencyApiProvider = CurrencyApiProvider();

  Future<CurrencyModel> fetchC(String C1, String C2) =>
      currencyApiProvider.fetchCurrencies(C1, C2);
}

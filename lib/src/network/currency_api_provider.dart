import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:flutter_wallet_app/src/models/curerncy_model.dart';
import 'package:flutter_wallet_app/src/utils/secret.dart';
import 'package:flutter_wallet_app/src/utils/field_constants.dart';

class CurrencyApiProvider {
  Client client = Client();

  static var asd;

  var apiKey = SecretLoader(secretPath: "secrets.json").load().then((result) {
    asd = result.apiKey;
  });

  Future<CurrencyModel> fetchCurrencies(String fC, String sC) async {
    final response = await client.get(
        "${FieldConstants.CURRENCY_BASE_URL}convert?q=USD_KZT,KZT_USD&apiKey=2f2315d8d6c6b3f2ef50&compact=ultra");
    if (response.statusCode == 200) {
      return CurrencyModel.fromJson(json.decode(response.body), "USD", "KZT");
    } else {
      throw Exception("Failed to load curencies");
    }
  }
}

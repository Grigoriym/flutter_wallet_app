import 'dart:async';
import 'dart:convert';

import 'package:flutter_wallet_app/src/models/currency_model.dart';
import 'package:flutter_wallet_app/src/models/currency/currency_list_model.dart';
import 'package:flutter_wallet_app/src/utils/field_constants.dart';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

Future<List<CurrencyListModel>> fetchList() async {
  print('1222222222222222222222222222');
  final response = await Client()
      .get("https://free.currconv.com/api/v7/currencies?apiKey=do-not-use");
  print(parseJson(response.body));
  return compute(parseCurr, response.body);
}

List<CurrencyListModel> parseCurr(String responseBody) {
  print('33333333333333333333333');
  print(responseBody);
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<CurrencyListModel>((json) => CurrencyListModel.fromJson(json))
      .toList();
}

  List<CurrencyListModel> parseJson(String response) {
    List<CurrencyListModel> products = List<CurrencyListModel>();
    print('ffffffffffffffffff');
    print(response.toString());
    List jsonParsed = json.decode(response.toString());
    for (int i = 0; i < jsonParsed.length; i++) {
      products.add(CurrencyListModel.fromJson(jsonParsed[i]));
    }
    return products;
  }

class CurrencyApiProvider {
  Client client = Client();

//  static var asd;

//  var apiKey = SecretLoader(secretPath: "secrets.json").load().then((result) {
//    asd = result.apiKey;
//  });

  Future<CurrencyModel> fetchCurrencies(String fC, String sC) async {
    final response = await client.get(
        "${FieldConstants.CURRENCY_BASE_URL}convert?q=USD_KZT,KZT_USD&apiKey=2f2315d8d6c6b3f2ef50&compact=ultra");
    if (response.statusCode == 200) {
      return CurrencyModel.fromJson(json.decode(response.body), "USD", "KZT");
    } else {
      throw Exception("Failed to load curencies");
    }
  }

//  Future<List<CurrencyListModel>> newFetchListOfCurrencies() async {
//    print('"dddddddddddddddddddd');
//    final response = await client
//        .get("https://free.currconv.com/api/v7/currencies?apiKey=do-not-use");
//    if (response.statusCode == 200) {
////      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
////      final result = parsed
////          .map<CurrencyListModel>((json) => CurrencyListModel.fromJson(json))
////          .toList();
////      return result;
//    return parseJson(response.body);
//    }
//  }

//  Future<List<CurrencyListModel>> fetchListOfCurrencies() async {
//    final response = await client
//        .get("https://free.currconv.com/api/v7/currencies?apiKey=do-not-use");
//    if (response.statusCode == 200) {
//      return CurrencyListModel.fromJson(json.decode(response.body));
//    } else {
//      throw Exception('failed to load currenceis lsit');
//    }
//  }
}

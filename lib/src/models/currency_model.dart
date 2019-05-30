import 'package:json_annotation/json_annotation.dart';

//part 'currency_model.g.dart';

//@JsonSerializable()
class CurrencyModel {
//  final double first;
//  final double second;

 double _first;
 double _second;

//  CurrencyModel({this.first, this.second});

  CurrencyModel.fromJson(Map<String, dynamic> parsedJson, String firstCurrency,
      String secondCurrency) {
    _first = parsedJson[
        '${firstCurrency.toUpperCase()}_${secondCurrency.toUpperCase()}'];
    _second = parsedJson[
        '${secondCurrency.toUpperCase()}_${firstCurrency.toUpperCase()}'];
  }

//  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
//      _$CurrencyModelFromJson(json);

//  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);

  double get second => _second;
  double get first => _first;
}

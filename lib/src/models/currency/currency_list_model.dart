import 'package:json_annotation/json_annotation.dart';

part 'currency_list_model.g.dart';

@JsonSerializable()
class CurrencyListModel extends Object {
  final String currencyName;
  final String currencySymbol;
  final String id;

  CurrencyListModel({this.currencyName, this.currencySymbol, this.id});

//  factory CurrencyListModel.fromJson(Map<String, dynamic> json) {
//    return CurrencyListModel(
//      currencyName: json['currencyName'] as String,
//      currencySymbol: json['currencySymbol'] as String,
//      id: json['id'] as String,
//    );
//  }
  factory CurrencyListModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyListModelToJson(this);
}

@JsonSerializable()
class Results {
  final List<CurrencyListModel> listOfModels;

  Results({this.listOfModels});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

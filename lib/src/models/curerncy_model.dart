class CurrencyModel {
  double _first;
  double _second;

  CurrencyModel.fromJson(Map<String, dynamic> parsedJson, String firstCurrency,
      String secondCurrency) {
    _first = parsedJson['${firstCurrency.toUpperCase()}_${secondCurrency.toUpperCase()}'];
    _second = parsedJson['${secondCurrency.toUpperCase()}_${firstCurrency.toUpperCase()}'];
  }

  double get first => _first;

  double get second => _second;
}

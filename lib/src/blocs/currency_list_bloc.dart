import 'package:flutter_wallet_app/src/models/currency/currency_list_model.dart';
import 'package:flutter_wallet_app/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class CurrencyListBloc {
  final _repository = Repository();
  final _fetcher = PublishSubject<List<CurrencyListModel>>();

  Observable<List<CurrencyListModel>> get listOfCurrencies => _fetcher.stream;

  fetchListOfCurrencies() async {
    print('111111111111111111111111');
    List<CurrencyListModel> currencyListModel =
        await _repository.fetchListOfCurrencies();
    _fetcher.sink.add(currencyListModel);
  }

  dispose() {
    _fetcher.close();
  }
}

final listBloc = CurrencyListBloc();

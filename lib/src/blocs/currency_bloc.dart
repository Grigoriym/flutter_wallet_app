import 'package:rxdart/rxdart.dart';
import 'package:flutter_wallet_app/src/models/curerncy_model.dart';
import 'package:flutter_wallet_app/src/repository/repository.dart';

class CurrencyBloc{
  final _repository = Repository();
  final _currenciesFetcher = PublishSubject<CurrencyModel>();

  Observable<CurrencyModel> get currencies => _currenciesFetcher.stream;

  fetchCurrencies(fC, sC) async{
    CurrencyModel currencyModel = await _repository.fetchC(fC, sC);
    _currenciesFetcher.sink.add(currencyModel);
  }

  dispose(){
    _currenciesFetcher.close();
  }

}

final bloc = CurrencyBloc();
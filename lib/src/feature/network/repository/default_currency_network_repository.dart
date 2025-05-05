import 'package:dio/dio.dart';
import 'package:exchanger/l10n/gen_l10n/app_localizations.dart';

import '../../../core/model/async_result.dart';
import '../../../core/model/currency.dart';
import '../../../core/repository/currency_network_repository.dart';

class DefaultCurrencyNetworkRepository implements CurrencyNetworkRepository {
  final Dio _dio;

  DefaultCurrencyNetworkRepository(this._dio);

  @override
  Future<AsyncResult<List<Currency>>> currencies() async {
    try {
      final response = await _dio.get("https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/eur.json");
      final data = response.data as Map<String, dynamic>;
      final rates = data["eur"] as Map<String, dynamic>;
      final currencies = [
        Currency.uah(rates["uah"] as num),
        Currency.rub(rates["rub"] as num),
        Currency.usd(rates["usd"] as num),
        Currency.gel(rates["gel"] as num),
        Currency.eur(rates["eur"] as num),
        Currency.ron(rates["ron"] as num),
        Currency.pln(rates["pln"] as num),
        Currency.gbp(rates["gbp"] as num),
        Currency.aud(rates["aud"] as num),
        Currency.cad(rates["cad"] as num),
        Currency.chf(rates["chf"] as num),
        Currency.cny(rates["cny"] as num),
        Currency.dkk(rates["dkk"] as num),
        Currency.hkd(rates["hkd"] as num),
        Currency.hrk(rates["hrk"] as num),
        Currency.huf(rates["huf"] as num),
        Currency.idr(rates["idr"] as num),
        Currency.ils(rates["ils"] as num),
        Currency.inr(rates["inr"] as num),
        Currency.jpy(rates["jpy"] as num),
        Currency.krw(rates["krw"] as num),
        Currency.mxn(rates["mxn"] as num),
        Currency.zar(rates["zar"] as num),
        Currency.sek(rates["sek"] as num),
        Currency.thb(rates["thb"] as num),
        Currency.try_(rates["try"] as num),
        Currency.vnd(rates["vnd"] as num),
      ]..sort((a, b) => a.briefName.compareTo(b.briefName));
      return AsyncResult.success(currencies);
    } on Exception catch (e) {
      return AsyncResult.failure(e);
    }
  }
}
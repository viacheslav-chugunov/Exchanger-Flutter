import 'package:dio/dio.dart';
import 'package:exchanger/core/model/currency.dart';
import 'package:exchanger/l10n/gen_l10n/app_localizations.dart';

import '../../../core/model/async_result.dart';
import '../../../core/repository/currency_network_repository.dart';

class DefaultCurrencyNetworkRepository implements CurrencyNetworkRepository {
  final Dio _dio;
  final AppLocalizations localizations;

  DefaultCurrencyNetworkRepository(this._dio, this.localizations);

  @override
  Future<AsyncResult<List<Currency>>> currencies() async {
    try {
      final response = await _dio.get("https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/eur.json");
      final data = response.data as Map<String, dynamic>;
      final rates = data["eur"] as Map<String, dynamic>;
      final currencies = [
        Currency.uah(localizations.uahFull, rates["uah"] as num),
        Currency.rub(localizations.rubFull, rates["rub"] as num),
        Currency.usd(localizations.usdFull, rates["usd"] as num),
        Currency.gel(localizations.gelFull, rates["gel"] as num),
        Currency.eur(localizations.eurFull, rates["eur"] as num),
        Currency.ron(localizations.ronFull, rates["ron"] as num),
        Currency.pln(localizations.plnFull, rates["pln"] as num),
        Currency.gbp(localizations.gbpFull, rates["gbp"] as num),
        Currency.aud(localizations.audFull, rates["aud"] as num),
        Currency.cad(localizations.cadFull, rates["cad"] as num),
        Currency.chf(localizations.chfFull, rates["chf"] as num),
        Currency.cny(localizations.cnyFull, rates["cny"] as num),
        Currency.dkk(localizations.dkkFull, rates["dkk"] as num),
        Currency.hkd(localizations.hkdFull, rates["hkd"] as num),
        Currency.hrk(localizations.hrkFull, rates["hrk"] as num),
        Currency.huf(localizations.hufFull, rates["huf"] as num),
        Currency.idr(localizations.idrFull, rates["idr"] as num),
        Currency.ils(localizations.ilsFull, rates["ils"] as num),
        Currency.inr(localizations.inrFull, rates["inr"] as num),
        Currency.jpy(localizations.jpyFull, rates["jpy"] as num),
        Currency.krw(localizations.krwFull, rates["krw"] as num),
        Currency.mxn(localizations.mxnFull, rates["mxn"] as num),
        Currency.zar(localizations.zarFull, rates["zar"] as num),
        Currency.sek(localizations.sekFull, rates["sek"] as num),
        Currency.thb(localizations.thbFull, rates["thb"] as num),
        Currency.try_(localizations.tryFull, rates["try"] as num),
        Currency.vnd(localizations.vndFull, rates["vnd"] as num),
      ]..sort((a, b) => a.fullName.compareTo(b.fullName));
      return AsyncResult.success(currencies);
    } on Exception catch (e) {
      return AsyncResult.failure(e);
    }
  }
}
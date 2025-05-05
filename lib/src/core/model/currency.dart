import 'package:exchanger/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class Currency {
  final num rate;
  final String briefName;
  final String imagePath;

  const Currency(this.rate, this.briefName, String image): imagePath = "assets/flags/$image";

  const Currency.uah(num rate): this(rate, "UAH", "ua.svg");
  const Currency.rub(num rate): this(rate, "RUB", "ru.svg");
  const Currency.usd(num rate): this(rate, "USD", "us.svg");
  const Currency.gel(num rate): this(rate, "GEL", "ge.svg");
  const Currency.eur(num rate): this(rate, "EUR", "eu.svg");
  const Currency.ron(num rate): this(rate, "RON", "ro.svg");
  const Currency.pln(num rate): this(rate, "PLN", "pl.svg");
  const Currency.gbp(num rate): this(rate, "GBP", "gb.svg");
  const Currency.aud(num rate): this(rate, "AUD", "au.svg");
  const Currency.cad(num rate): this(rate, "CAD", "ca.svg");
  const Currency.chf(num rate): this(rate, "CHF", "ch.svg");
  const Currency.cny(num rate): this(rate, "CNY", "cn.svg");
  const Currency.dkk(num rate): this(rate, "DKK", "dk.svg");
  const Currency.hkd(num rate): this(rate, "HKD", "hk.svg");
  const Currency.hrk(num rate): this(rate, "HRK", "hr.svg");
  const Currency.huf(num rate): this(rate, "HUF", "hu.svg");
  const Currency.idr(num rate): this(rate, "IDR", "id.svg");
  const Currency.ils(num rate): this(rate, "ILS", "il.svg");
  const Currency.inr(num rate): this(rate, "INR", "in.svg");
  const Currency.jpy(num rate): this(rate, "JPY", "jp.svg");
  const Currency.krw(num rate): this(rate, "KRW", "kr.svg");
  const Currency.mxn(num rate): this(rate, "MXN", "mx.svg");
  const Currency.zar(num rate): this(rate, "ZAR", "za.svg");
  const Currency.sek(num rate): this(rate, "SEK", "se.svg");
  const Currency.thb(num rate): this(rate, "THB", "th.svg");
  const Currency.try_(num rate): this(rate, "TRY", "tr.svg");
  const Currency.vnd(num rate): this(rate, "VND", "vn.svg");

  String fullName(AppLocalizations localization) {
    switch (briefName) {
      case "UAH": return localization.uahFull;
      case "RUB": return localization.rubFull;
      case "USD": return localization.usdFull;
      case "GEL": return localization.gelFull;
      case "EUR": return localization.eurFull;
      case "RON": return localization.ronFull;
      case "PLN": return localization.plnFull;
      case "GBP": return localization.gbpFull;
      case "AUD": return localization.audFull;
      case "CAD": return localization.cadFull;
      case "CHF": return localization.chfFull;
      case "CNY": return localization.cnyFull;
      case "DKK": return localization.dkkFull;
      case "HKD": return localization.hkdFull;
      case "HRK": return localization.hrkFull;
      case "HUF": return localization.hufFull;
      case "IDR": return localization.idrFull;
      case "ILS": return localization.ilsFull;
      case "INR": return localization.inrFull;
      case "JPY": return localization.jpyFull;
      case "KRW": return localization.krwFull;
      case "MXN": return localization.mxnFull;
      case "ZAR": return localization.zarFull;
      case "SEK": return localization.sekFull;
      case "THB": return localization.thbFull;
      case "TRY": return localization.tryFull;
      case "VND": return localization.vndFull;
      default: throw ArgumentError("Unknown currency: $briefName");
    }
  }

}
import 'package:flutter/cupertino.dart';

class Currency {
  final num rate;
  final String fullName;
  final String briefName;
  final String imagePath;

  const Currency(this.rate, this.fullName, this.briefName, String image): imagePath = "assets/flags/$image";

  const Currency.uah(String fullName, num rate): this(rate, fullName, "UAH", "ua.svg");
  const Currency.rub(String fullName, num rate): this(rate, fullName, "RUB", "ru.svg");
  const Currency.usd(String fullName, num rate): this(rate, fullName, "USD", "us.svg");
  const Currency.gel(String fullName, num rate): this(rate, fullName, "GEL", "ge.svg");
  const Currency.eur(String fullName, num rate): this(rate, fullName, "EUR", "eu.svg");
  const Currency.ron(String fullName, num rate): this(rate, fullName, "RON", "ro.svg");
  const Currency.pln(String fullName, num rate): this(rate, fullName, "PLN", "pl.svg");
  const Currency.gbp(String fullName, num rate): this(rate, fullName, "GBP", "gb.svg");
  const Currency.aud(String fullName, num rate): this(rate, fullName, "AUD", "au.svg");
  const Currency.cad(String fullName, num rate): this(rate, fullName, "CAD", "ca.svg");
  const Currency.chf(String fullName, num rate): this(rate, fullName, "CHF", "ch.svg");
  const Currency.cny(String fullName, num rate): this(rate, fullName, "CNY", "cn.svg");
  const Currency.dkk(String fullName, num rate): this(rate, fullName, "DKK", "dk.svg");
  const Currency.hkd(String fullName, num rate): this(rate, fullName, "HKD", "hk.svg");
  const Currency.hrk(String fullName, num rate): this(rate, fullName, "HRK", "hr.svg");
  const Currency.huf(String fullName, num rate): this(rate, fullName, "HUF", "hu.svg");
  const Currency.idr(String fullName, num rate): this(rate, fullName, "IDR", "id.svg");
  const Currency.ils(String fullName, num rate): this(rate, fullName, "ILS", "il.svg");
  const Currency.inr(String fullName, num rate): this(rate, fullName, "INR", "in.svg");
  const Currency.jpy(String fullName, num rate): this(rate, fullName, "JPY", "jp.svg");
  const Currency.krw(String fullName, num rate): this(rate, fullName, "KRW", "kr.svg");
  const Currency.mxn(String fullName, num rate): this(rate, fullName, "MXN", "mx.svg");
  const Currency.zar(String fullName, num rate): this(rate, fullName, "ZAR", "za.svg");
  const Currency.sek(String fullName, num rate): this(rate, fullName, "SEK", "se.svg");
  const Currency.thb(String fullName, num rate): this(rate, fullName, "THB", "th.svg");
  const Currency.try_(String fullName, num rate): this(rate, fullName, "TRY", "tr.svg");
  const Currency.vnd(String fullName, num rate): this(rate, fullName, "VND", "vn.svg");


}
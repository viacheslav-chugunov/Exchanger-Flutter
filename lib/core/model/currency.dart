class Currency {
  final num rate;
  final String fullName;
  final String briefName;
  final String imagePath;

  const Currency(this.rate, this.fullName, this.briefName, String image): imagePath = "assets/flags/$image";

  const Currency.uah(num rate): this(rate, "Ukrainian Hryvnia", "UAH", "ua.svg");
  const Currency.rub(num rate): this(rate, "Russian Ruble", "RUB", "ru.svg");
  const Currency.usd(num rate): this(rate, "US Dollar", "USD", "us.svg");
  const Currency.gel(num rate): this(rate, "Georgian Lari", "GEL", "ge.svg");
  const Currency.eur(num rate): this(rate, "Euro", "EUR", "eu.svg");
  const Currency.ron(num rate): this(rate, "Romanian Leu", "RON", "ro.svg");
  const Currency.pln(num rate): this(rate, "Polish Zloty", "PLN", "pl.svg");
  const Currency.gbp(num rate): this(rate, "British Pound Sterling", "GBP", "gb.svg");
  const Currency.aud(num rate): this(rate, "Australian Dollar", "AUD", "au.svg");
  const Currency.cad(num rate): this(rate, "Canadian Dollar", "CAD", "ca.svg");
  const Currency.chf(num rate): this(rate, "Swiss Franc", "CHF", "ch.svg");
  const Currency.cny(num rate): this(rate, "Chinese Yuan Renminbi", "CNY", "cn.svg");
  const Currency.dkk(num rate): this(rate, "Danish Krone", "DKK", "dk.svg");
  const Currency.hkd(num rate): this(rate, "Hong Kong Dollar", "HKD", "hk.svg");
  const Currency.hrk(num rate): this(rate, "Croatian Kuna", "HRK", "hr.svg");
  const Currency.huf(num rate): this(rate, "Hungarian Forint", "HUF", "hu.svg");
  const Currency.idr(num rate): this(rate, "Indonesian Rupiah", "IDR", "id.svg");
  const Currency.ils(num rate): this(rate, "Israeli New Shekel", "ILS", "il.svg");
  const Currency.inr(num rate): this(rate, "Indian Rupee", "INR", "in.svg");
  const Currency.jpy(num rate): this(rate, "Japanese Yen", "JPY", "jp.svg");
  const Currency.krw(num rate): this(rate, "South Korean Won", "KRW", "kr.svg");
  const Currency.mxn(num rate): this(rate, "Mexican Peso", "MXN", "mx.svg");
  const Currency.zar(num rate): this(rate, "South African Rand", "ZAR", "za.svg");
  const Currency.sek(num rate): this(rate, "Swedish Krona", "SEK", "se.svg");
  const Currency.thb(num rate): this(rate, "Thai Baht", "THB", "th.svg");
  const Currency.try_(num rate): this(rate, "Turkish Lira", "TRY", "tr.svg");
  const Currency.vnd(num rate): this(rate, "Vietnamese Dong", "VND", "vn.svg");


}
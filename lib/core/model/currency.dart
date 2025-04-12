class Currency {
  final double rate;
  final String fullName;
  final String briefName;
  final String imagePath;

  const Currency(this.rate, this.fullName, this.briefName, String image): imagePath = "assets/flags/$image";

  const Currency.uah(double rate): this(rate, "Ukrainian Hryvnia", "UAH", "ua.svg");
  const Currency.rub(double rate): this(rate, "Russian Ruble", "RUB", "ru.svg");
  const Currency.usd(double rate): this(rate, "US Dollar", "USD", "us.svg");
  const Currency.gel(double rate): this(rate, "Georgian Lari", "GEL", "ge.svg");

}
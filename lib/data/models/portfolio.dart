import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'chart.dart';

class Portfolio extends Equatable {
  final Current current;
  final List<Stock> stocks;
  final List<Crypto> cryptos;
  final List<CandleStick> series;

  const Portfolio({
    required this.stocks,
    required this.series,
    required this.current,
    required this.cryptos,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    final j = jsonDecode(json['valuation']);
    return Portfolio(
      current: Current.fromJson(j['current']),
      stocks: [for (var s in j['stocks']) Stock.fromJson(s)],
      series: [for (var cs in j['timeSeries']) CandleStick.fromJson(cs)],
      cryptos: [for (var c in j['cryptocurrencies']) Crypto.fromJson(c)],
    );
  }

  factory Portfolio.defaultPortfolio() => Portfolio(
        stocks: [],
        series: [],
        cryptos: [],
        current: Current(
          totalValue: 0.0,
          cryptocurrencies: Cryptos(
            value: 0.0,
            percentage: 0.0,
          ),
          stocksAndOptions: StocksAndOptions(
            value: 0.0,
            percentage: 0.0,
          ),
        ),
      );

  @override
  List<Object?> get props => [current, stocks, cryptos, series];
}

class Current extends Equatable {
  final double totalValue;
  final Cryptos cryptocurrencies;
  final StocksAndOptions stocksAndOptions;

  const Current({
    required this.totalValue,
    required this.stocksAndOptions,
    required this.cryptocurrencies,
  });

  factory Current.fromJson(Map<String, dynamic> j) => Current(
        totalValue: j['totalValue'],
        cryptocurrencies: Cryptos.fromJson(j['cryptocurrencies']),
        stocksAndOptions: StocksAndOptions.fromJson(j['stocks_and_options']),
      );

  @override
  List<Object?> get props => [totalValue, cryptocurrencies, stocksAndOptions];
}

class Investment extends Equatable {
  final double value;
  final double percentage;

  const Investment({
    required this.value,
    required this.percentage,
  });

  factory Investment.fromJson(Map<String, dynamic> j) => Investment(value: j['value'], percentage: j['percentage']);

  @override
  List<Object?> get props => [value, percentage];
}

class StocksAndOptions extends Investment {
  const StocksAndOptions({
    required double value,
    required double percentage,
  }) : super(value: value, percentage: percentage);

  factory StocksAndOptions.fromJson(Map<String, dynamic> j) =>
      StocksAndOptions(value: j['value'], percentage: j['percentage']);
}

class Cryptos extends Investment {
  const Cryptos({
    required double value,
    required double percentage,
  }) : super(value: value, percentage: percentage);

  factory Cryptos.fromJson(Map<String, dynamic> j) => Cryptos(value: j['value'], percentage: j['percentage']);
}

class Stock extends Equatable {
  final double price;
  final String symbol;
  final double quantity;

  const Stock({
    required this.price,
    required this.symbol,
    required this.quantity,
  });

  factory Stock.fromJson(Map<String, dynamic> j) => Stock(
        price: j['price'],
        symbol: j['symbol'],
        quantity: j['quantity'],
      );

  @override
  List<Object?> get props => [price, symbol, quantity];
}

class Crypto extends Equatable {
  final int quantity;
  final double price;
  final String symbol;

  const Crypto({
    required this.price,
    required this.symbol,
    required this.quantity,
  });

  factory Crypto.fromJson(Map<String, dynamic> j) => Crypto(
        price: j['price'],
        symbol: j['symbol'],
        quantity: j['quantity'],
      );

  @override
  List<Object?> get props => [price, symbol, quantity];
}

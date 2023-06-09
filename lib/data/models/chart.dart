import 'package:equatable/equatable.dart';

class CandleStick extends Equatable {
  final double? low;
  final String? date;
  final double? open;
  final double? high;
  final double? close;
  final double? value;

  const CandleStick({
    this.low,
    this.date,
    this.open,
    this.high,
    this.close,
    this.value,
  });

  factory CandleStick.fromJson(Map<String, dynamic> j) => CandleStick(
        low: j['value'],
        open: j['value'],
        high: j['value'],
        close: j['value'],
        value: j['value'],
        date: j['timestamp'],
      );

  @override
  String toString() {
    return 'CandleStick { '
        'low: $low, '
        'date: $date, '
        'open: $open, '
        'high: $high, '
        'value: $value, '
        'close: $close, '
        '}';
  }

  @override
  List<Object?> get props => [low, date, open, high, close, value];
}

class DataPoint extends Equatable {
  final String x;
  final double y;

  const DataPoint(this.x, this.y);

  @override
  List<Object?> get props => [x, y];
}

import 'package:intl/intl.dart';

class FormatNumbers {
  static String readbleNumber(double number, [int decimals = 0]) {
    return NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en',
    ).format(number);
  }
}

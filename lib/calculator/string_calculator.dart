import 'dart:core';
import 'string_calculator_exception.dart';

class StringCalculator {
  static const String defaultDelimiter = ',|\n';
  static final RegExp customDelimiterPattern = RegExp(r'//(.+)\n(.*)');

  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = defaultDelimiter;
    String numberString = numbers;

    final match = customDelimiterPattern.firstMatch(numbers);
    if (match != null) {
      delimiter = RegExp.escape(match.group(1)!);  // Fix: Assign as String
      numberString = match.group(2)!;
    }

    return _calculateSum(numberString.split(RegExp(delimiter)));  // Use RegExp here
  }

  int _calculateSum(List<String> numArray) {
    List<int> negatives = [];
    int sum = 0;

    for (String num in numArray) {
      if (num.trim().isNotEmpty) {
        int parsedNumber = int.parse(num.trim());
        if (parsedNumber < 0) {
          negatives.add(parsedNumber);
        } else {
          sum += parsedNumber;
        }
      }
    }

    if (negatives.isNotEmpty) {
      throw StringCalculatorException(
          'Negative numbers not allowed: ${negatives.join(", ")}');
    }

    return sum;
  }
}

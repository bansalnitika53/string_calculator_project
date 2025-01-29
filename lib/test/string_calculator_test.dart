import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/calculator/string_calculator.dart';
import 'package:string_calculator_tdd/calculator/string_calculator_exception.dart';

void main() {
  final calculator = StringCalculator();

  test('Empty string should return 0', () {
    expect(calculator.add(""), equals(0));
  });

  test('Single number should return the number itself', () {
    expect(calculator.add("1"), equals(1));
  });

  test('Two numbers should return their sum', () {
    expect(calculator.add("1,5"), equals(6));
  });

  test('Handle multiple numbers', () {
    expect(calculator.add("1,2,3,4"), equals(10));
  });

  test('Handle newlines as valid delimiters', () {
    expect(calculator.add("1\n2,3"), equals(6));
  });

  test('Support custom delimiter', () {
    expect(calculator.add("//;\n1;2"), equals(3));
  });

  test('Throw exception for negative numbers', () {
    expect(() => calculator.add("1,-2,3"),
        throwsA(isA<StringCalculatorException>()));
  });

  test('Exception message should include all negative numbers', () {
    try {
      calculator.add("1,-2,-3");
    } catch (e) {
      expect(e.toString(), equals("Negative numbers not allowed: -2, -3"));
    }
  });
}
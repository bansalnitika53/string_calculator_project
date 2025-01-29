class StringCalculatorException implements Exception {
  final String message;
  StringCalculatorException(this.message);

  @override
  String toString() => message;
}

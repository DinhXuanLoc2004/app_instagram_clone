import 'dart:convert';
import 'dart:math';

extension StringExtension on String {
  String generateNonce([int lenght = 32]) {
    final random = Random.secure();
    final values = List<int>.generate(length, (_) => random.nextInt(256));
    return base64UrlEncode(values).replaceAll('=', '');
  }
}

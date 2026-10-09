import 'package:flutter/material.dart';
import 'package:space_launches/app.dart';

const String _locale = String.fromEnvironment('LOCALE');

void main() {
  runApp(App(locale: _locale.isEmpty ? null : Locale(_locale)));
}

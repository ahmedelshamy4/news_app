import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/ui/my_app.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

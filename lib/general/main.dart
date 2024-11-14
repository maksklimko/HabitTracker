import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/general/app.dart';

Future main() async{
  runApp(ProviderScope(
    child: App(),
  ),);
}

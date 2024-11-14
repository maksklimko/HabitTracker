import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/providers/database_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      body: Column(children: [
        FutureBuilder(future: db.getHabits(), builder: (ctx,snapshot){
          if(snapshot.hasData) return Text(snapshot.data.toString());
          return CircularProgressIndicator();
        })
      ],),
    );
  }
}

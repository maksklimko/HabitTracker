import 'package:flutter/material.dart';

class StatisticTab extends StatelessWidget {
  const StatisticTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Coming soon...",style: Theme.of(context).textTheme.labelLarge,),
        ],
      ),
    );
  }
}

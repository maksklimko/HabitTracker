import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class CrossButton extends StatelessWidget {
  const CrossButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Beamer.of(context).beamBack();
      },
      child: const Icon(Icons.close),
    );
  }
}

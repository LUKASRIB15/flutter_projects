import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';
import 'package:first_app/text.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget{
  const GradientContainer(this.colors, {super.key});
  final List<Color> colors;
  @override
  Widget build(BuildContext context){
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Center(
            child: DiceRoller(),
          )
        );
  }
}
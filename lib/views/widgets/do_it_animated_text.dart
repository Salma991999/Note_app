import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class DoItAnimatedText extends StatelessWidget {
  const DoItAnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: DefaultTextStyle(
      style: const TextStyle(
      fontSize: 25.0,
        color: MyColors.myWhite,
        shadows: [
          Shadow(
            blurRadius: 5.0,
            color: MyColors.myWhite,
            offset: Offset(0.2, 0.5),
          ),
        ],
    ),
      child: AnimatedTextKit(
      pause: const Duration(milliseconds: 200),
    repeatForever: true,
    animatedTexts: [
    WavyAnimatedText('Let\'s  do  it'),
    ],
    isRepeatingAnimation: true,
    ),),
    );
  }
}

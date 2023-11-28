import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

final Random random = Random();

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  late ShakeDetector shakeDetector;
  int currentFirstDiceRoll = 1;
  int currentSecondDiceRoll = 5;

  @override
  void initState() {
    super.initState();
    shakeDetector = ShakeDetector.autoStart(onPhoneShake: () {
      rollDice();
    });
  }

  @override
  void dispose() {
    super.dispose();
    shakeDetector.stopListening();
  }

  void rollDice() {
    setState(() {
      currentFirstDiceRoll = random.nextInt(6) + 1;
      currentSecondDiceRoll = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/dice-$currentFirstDiceRoll.png",
              width: 150,
            ),
            Image.asset(
              "assets/images/dice-$currentSecondDiceRoll.png",
              width: 150,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 24),
          ),
          child: const Text("Roll Dice or Shake"),
        ),
      ],
    );
  }
}

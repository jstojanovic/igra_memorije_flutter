import 'package:flutter/material.dart';
import 'package:igra_memorije/widgets/igračka_ploča.dart';

class MemoryPage extends StatelessWidget {
  const MemoryPage({
    required this.gameLevel,
    super.key,
  });

  final int gameLevel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: MemoryBoard(
        gameLevel: gameLevel,
      )),
    );
  }
}

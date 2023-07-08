import 'package:flutter/material.dart';
import 'package:igra_memorije/stranice/igračka_stranica.dart';
import 'package:igra_memorije/widgets/gumbe_odabira_težine.dart';
import 'package:igra_memorije/utils/leveli.dart';

class GameOptions extends StatefulWidget {
  const GameOptions({Key? key}) : super(key: key);

  static Route<dynamic> _routeBuilder(BuildContext context, int gameLevel) {
    return MaterialPageRoute(
      builder: (_) {
        return MemoryPage(gameLevel: gameLevel);
      },
    );
  }

  @override
  State<GameOptions> createState() => _GameOptionsState();
}

class _GameOptionsState extends State<GameOptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: gameLevels.map((level) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GameOptionsButton(
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                GameOptions._routeBuilder(context, level['level']),
                (Route<dynamic> route) => false),
            title: level['title'],
            color: level['color']![700]!,
            width: 250,
          ),
        );
      }).toList(),
    );
  }
}

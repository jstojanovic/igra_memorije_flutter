import 'dart:async';
import 'package:flutter/material.dart';
import 'package:igra_memorije/modeli/igra.dart';
import 'package:igra_memorije/widgets/igračka_karta.dart';
import 'package:igra_memorije/stranice/početna_stranica.dart';
import 'package:igra_memorije/widgets/gumbe_odabira_težine.dart';

class IgrackaPloca extends StatefulWidget {
  const IgrackaPloca({
    required this.gameLevel,
    super.key,
  });

  final int gameLevel;

  @override
  State<IgrackaPloca> createState() => _IgrackaPlocaState();
}

class _IgrackaPlocaState extends State<IgrackaPloca> {
  late Timer timer;
  late Game game;

  @override
  void initState() {
    super.initState();
    game = Game(widget.gameLevel);
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 200), (_) async {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final aspectRatio = MediaQuery.of(context).size.aspectRatio;

    return SafeArea(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: game.gridSize,
                  childAspectRatio: aspectRatio * 2,
                  children: List.generate(game.cards.length, (index) {
                    return IgrackaKarta(
                      index: index,
                      card: game.cards[index],
                      onCardPressed: game.onCardPressed,
                    );
                  }),
                ),
              ),
              GumbeOdabiraTezine(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const PocetnaStranica();
                  }), (Route<dynamic> route) => false);
                },
                title: 'QUIT',
                color: Colors.red,
                width: 100,
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

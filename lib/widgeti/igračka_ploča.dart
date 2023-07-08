import 'dart:async';
import 'package:flutter/material.dart';
import 'package:igra_memorije/modeli/igra.dart';
import 'package:igra_memorije/widgeti/igra%C4%8Dka_karta.dart';
import 'package:igra_memorije/stranice/početna_stranica.dart';
import 'package:igra_memorije/widgeti/gumbe_odabira_te%C5%BEine.dart';

class IgrackaPloca extends StatefulWidget {
  const IgrackaPloca({
    required this.tezinaIgre,
    super.key,
  });

  final int tezinaIgre;

  @override
  State<IgrackaPloca> createState() => _IgrackaPlocaState();
}

class _IgrackaPlocaState extends State<IgrackaPloca> {
  late Timer timer;
  late Igra igra;

  @override
  void initState() {
    super.initState();
    igra = Igra(widget.tezinaIgre);
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
                  crossAxisCount: igra.gridSize,
                  childAspectRatio: aspectRatio * 2,
                  children: List.generate(igra.cards.length, (index) {
                    return IgrackaKarta(
                      index: index,
                      card: igra.cards[index],
                      onCardPressed: igra.onCardPressed,
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

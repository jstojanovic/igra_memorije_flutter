import 'package:flutter/material.dart';
import 'package:igra_memorije/widgeti/igra%C4%8Dka_plo%C4%8Da.dart';

class IgrackaStranica extends StatelessWidget {
  const IgrackaStranica({
    required this.tezinaIgre,
    super.key,
  });

  final int tezinaIgre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IgrackaPloca(
        tezinaIgre: tezinaIgre,
      )),
    );
  }
}

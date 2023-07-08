import 'package:flutter/material.dart';
import 'package:igra_memorije/widgets/postavke_igre.dart';

class PocetnaStranica extends StatelessWidget {
  const PocetnaStranica({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "IGRA MEMORIJE!",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                PostavkeIgre(),
              ]),
        ),
      ),
    );
  }
}

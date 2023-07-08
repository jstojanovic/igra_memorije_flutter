import 'package:flutter/material.dart';
import 'package:igra_memorije/stranice/početna_stranica.dart';

class MemoryGame extends StatelessWidget {
  const MemoryGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const StartUpPage(),
      title: 'Memory',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}

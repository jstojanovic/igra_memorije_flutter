import 'package:flutter/material.dart';
import 'package:igra_memorije/stranice/početna_stranica.dart';

class IgraMemorije extends StatelessWidget {
  const IgraMemorije({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PocetnaStranica(),
      title: 'Memory',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';

enum StanjeIgraceKarte { hidden, visible, guessed }

class ObjektKarta {
  final int value;
  StanjeIgraceKarte state = StanjeIgraceKarte.hidden;
  IconData icon;
  Color color;
  ObjektKarta(
    this.value,
    this.state,
    this.icon,
    this.color,
  );
}

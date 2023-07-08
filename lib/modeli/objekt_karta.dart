import 'package:flutter/material.dart';

enum StanjeIgraceKarte { hidden, visible, guessed }

class CardItem {
  final int value;
  StanjeIgraceKarte state = StanjeIgraceKarte.hidden;
  IconData icon;
  Color color;
  CardItem(
    this.value,
    this.state,
    this.icon,
    this.color,
  );
}

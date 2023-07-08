import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:igra_memorije/modeli/objekt_karta.dart';
import 'package:igra_memorije/utils/ikonice.dart';

class Game {
  int gridSize;
  List<CardItem> cards = [];
  bool isGameOver = false;
  int visibleCardCount = 0; // Track the number of visible cards

  Set<IconData> icons = {};

  Game(this.gridSize) {
    generateCards();
  }

  void generateIcons() {
    icons = <IconData>{};
    for (int j = 0; j < (gridSize * gridSize / 2); j++) {
      final IconData icon = _getRandomCardIcon();
      icons.add(icon);
      icons.add(icon);
    }
  }

  IconData _getRandomCardIcon() {
    final Random random = Random();
    IconData icon;
    do {
      icon = ikoneZaIgracuKartu[random.nextInt(ikoneZaIgracuKartu.length)];
    } while (icons.contains(icon));
    return icon;
  }

  void generateCards() {
    generateIcons();
    cards = [];
    final List<Color> cardColors = Colors.primaries.toList();
    for (int i = 0; i < (gridSize * gridSize / 2); i++) {
      final cardValue = i + 1;
      final IconData icon = icons.elementAt(i);
      final Color cardColor = cardColors[i % cardColors.length];
      final List<CardItem> newCards =
          _createCardItems(icon, cardColor, cardValue);
      cards.addAll(newCards);
    }
    cards.shuffle(Random());
  }

  void resetGame() {
    generateCards();
    isGameOver = false;
  }

  List<CardItem> _createCardItems(
      IconData icon, Color cardColor, int cardValue) {
    return List.generate(
        2,
        (index) => CardItem(
              cardValue,
              StanjeIgraceKarte.hidden,
              icon,
              cardColor,
            ));
  }

  void onCardPressed(int index) {
    final CardItem selectedCard = cards[index];
    if (selectedCard.state == StanjeIgraceKarte.hidden &&
        visibleCardCount < 2) {
      selectedCard.state = StanjeIgraceKarte.visible;
      visibleCardCount++;

      final List<int> visibleCardIndexes = _getVisibleCardIndexes();
      if (visibleCardIndexes.length == 2) {
        final CardItem card1 = cards[visibleCardIndexes[0]];
        final CardItem card2 = cards[visibleCardIndexes[1]];

        if (card1.value == card2.value) {
          card1.state = StanjeIgraceKarte.guessed;
          card2.state = StanjeIgraceKarte.guessed;
          visibleCardCount -= 2; // Decrease the visible card count
          isGameOver = _isGameOver();
        } else {
          Future.delayed(const Duration(milliseconds: 800), () {
            card1.state = StanjeIgraceKarte.hidden;
            card2.state = StanjeIgraceKarte.hidden;
            visibleCardCount -= 2; // Decrease the visible card count
          });
        }
      }
    }
  }

  List<int> _getVisibleCardIndexes() {
    return cards
        .asMap()
        .entries
        .where((entry) => entry.value.state == StanjeIgraceKarte.visible)
        .map((entry) => entry.key)
        .toList();
  }

  bool _isGameOver() {
    return cards.every((card) => card.state == StanjeIgraceKarte.guessed);
  }
}

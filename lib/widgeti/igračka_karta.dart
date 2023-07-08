import 'package:flutter/material.dart';
import 'package:igra_memorije/modeli/objekt_karta.dart';

class IgrackaKarta extends StatelessWidget {
  final CardItem card;
  final Function(int) onCardPressed;
  final int index;

  const IgrackaKarta({
    Key? key,
    required this.card,
    required this.index,
    required this.onCardPressed,
  }) : super(key: key);

  void handleCardTap() {
    if (card.state == StanjeIgraceKarte.hidden) {
      onCardPressed(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handleCardTap,
      child: Card(
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        color: card.state == StanjeIgraceKarte.visible ||
                card.state == StanjeIgraceKarte.guessed
            ? card.color
            : Colors.grey,
        child: Center(
          child: card.state == StanjeIgraceKarte.hidden
              ? null
              : SizedBox.expand(
                  child: FittedBox(
                    child: Icon(
                      card.icon,
                      color: Colors.white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

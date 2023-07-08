import 'package:flutter/material.dart';
import 'package:igra_memorije/stranice/igračka_stranica.dart';
import 'package:igra_memorije/widgeti/gumbe_odabira_te%C5%BEine.dart';
import 'package:igra_memorije/utilsi/leveli.dart';

class PostavkeIgre extends StatefulWidget {
  const PostavkeIgre({Key? key}) : super(key: key);

  static Route<dynamic> _routeBuilder(BuildContext context, int tezinaIgre) {
    return MaterialPageRoute(
      builder: (_) {
        return IgrackaStranica(tezinaIgre: tezinaIgre);
      },
    );
  }

  @override
  State<PostavkeIgre> createState() => _PostavkeIgreState();
}

class _PostavkeIgreState extends State<PostavkeIgre> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: tezinaIgre.map((level) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GumbeOdabiraTezine(
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                PostavkeIgre._routeBuilder(context, level['level']),
                (Route<dynamic> route) => false),
            title: level['title'],
            color: level['color']![700]!,
            width: 250,
          ),
        );
      }).toList(),
    );
  }
}

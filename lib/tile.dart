import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  Icon playerIcon;
  Icon pcIcon;
  final int value;
  Tile(this.pcIcon, this.playerIcon, this.value);
  @override
  State<StatefulWidget> createState() {
    return _TileState();
  }
}

class _TileState extends State<Tile> {
  Icon? displayedIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Se houve um toque, foi o jogador
        setState(() {
          displayedIcon = widget.playerIcon;
        });
      },
      child: Card(
        color: Colors.white60,
        child: displayedIcon == null ? displayedIcon : Container(),
      ),
    );
  }

  void pcTurn() {
    setState(() {
      displayedIcon = widget.pcIcon;
    });
  }
}

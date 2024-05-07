// Usar um GridView ou List pode ser exagero para esse exercício

import 'package:flutter/material.dart';
import 'tile.dart';

class Grid3 extends StatefulWidget {
  Icon playerIcon;
  Icon pcIcon;

  Grid3(this.playerIcon, this.pcIcon);
  @override
  State<StatefulWidget> createState() {
    return _Grid3State();
  }
}

class _Grid3State extends State<Grid3> {
  @override
  Widget build(BuildContext context) {
    // Todo icone tem um valor
    var tiles = [
      [
        Tile(widget.pcIcon, widget.playerIcon, 1 << 8),
        Tile(widget.pcIcon, widget.playerIcon, 1 << 7),
        Tile(widget.pcIcon, widget.playerIcon, 1 << 6)
      ],
      [
        Tile(widget.pcIcon, widget.playerIcon, 1 << 5),
        Tile(widget.pcIcon, widget.playerIcon, 1 << 4),
        Tile(widget.pcIcon, widget.playerIcon, 1 << 3),
      ],
      [
        Tile(widget.pcIcon, widget.playerIcon, 1 << 2),
        Tile(widget.pcIcon, widget.playerIcon, 1 << 1),
        Tile(widget.pcIcon, widget.playerIcon, 1)
      ]
    ];
    throw UnimplementedError();
  }
}

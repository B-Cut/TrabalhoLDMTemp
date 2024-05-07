// Usar um GridView ou List pode ser exagero para esse exercício

import 'dart:math';

import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  Icon playerIcon;
  Icon pcIcon;
  final Icon openIcon = const Icon(Icons.question_mark);
  late List<Icon> displaysVars;
  int gridSize;

  Grid(this.playerIcon, this.pcIcon, this.gridSize) {
    displaysVars = () {
      List<Icon> temp = [];
      for (var i = 0; i < gridSize * gridSize; i++) {
        temp.add(openIcon);
      }
      return temp;
    }.call();
  }
  @override
  State<StatefulWidget> createState() {
    print("Abriu o Grid");
    return _GridState();
  }
}

class _GridState extends State<Grid> {
  // O Tabuleiro tem o formato
  // 8 7 6
  // 5 4 3
  // 2 1 0

  final SOMAS_VITORIA = [
    ((1 << 8) + (1 << 7) + (1 << 6)),
    ((1 << 5) + (1 << 4) + (1 << 3)),
    ((1 << 2) + (1 << 1) + (1 << 0)),

    // Colunas completas
    ((1 << 8) + (1 << 5) + (1 << 2)),
    ((1 << 7) + (1 << 4) + (1 << 1)),
    ((1 << 6) + (1 << 3) + (1 << 0)),

    // Diagonais
    ((1 << 8) + (1 << 4) + (1 << 0)),
    ((1 << 6) + (1 << 4) + (1 << 2))
  ];

  void turno() {
    setState(() {
      determinaVitoria(widget.playerIcon);
      pickRandomTile();
      determinaVitoria(widget.pcIcon);
    });
  }

  void determinaVitoria(Icon jogador) {
    int soma = 0;
    for (int i = 0; i < widget.displaysVars.length; i++) {
      if (widget.displaysVars[i] == jogador) {
        soma += 1 << i;
      }
    }

    if (SOMAS_VITORIA.contains(soma)) {
      print("Vitoria!");
    }
  }

  void pickRandomTile() {
    while (true) {
      int i = Random().nextInt(widget.displaysVars.length);
      if (widget.displaysVars[i] == widget.openIcon) {
        widget.displaysVars[i] = widget.pcIcon;
        return;
      }
    }
  }

  void playerUpdate(int index) {
    setState(() {
      widget.displaysVars[index] = widget.playerIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Todo Card tem um valor único que é somado ao final do turno

    return GridView.builder(
        itemCount: widget.gridSize * widget.gridSize,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.gridSize),
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              playerUpdate(index);
              turno();
            },
            child: Card.filled(
              color: Colors.red,
              child: widget.displaysVars[index],
            ),
          );
        }));
  }
}

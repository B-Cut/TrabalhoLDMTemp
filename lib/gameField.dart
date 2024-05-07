import 'package:flutter/material.dart';
import 'package:jogo_da_velha/grid.dart';

class GameField extends StatefulWidget {
  late String userName;
  late Icon userSymbol;
  late Icon pcSymbol;
  late int tableSize;
  GameField(String username, String symbol, String size, {super.key}) {
    this.userName = username;

    if (symbol == "x") {
      this.userSymbol = const Icon(Icons.close, color: Colors.blue);
      this.pcSymbol = const Icon(Icons.circle, color: Colors.blue);
    } else {
      this.userSymbol = const Icon(Icons.circle, color: Colors.blue);
      this.pcSymbol = const Icon(Icons.close, color: Colors.blue);
    }

    this.tableSize = size == "3" ? 3 : 4;
  }
  @override
  State<StatefulWidget> createState() {
    return _GameFieldState();
  }
}

class _GameFieldState extends State<GameField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tabuleiro"),
        ),
        body: Grid(widget.userSymbol, widget.pcSymbol, widget.tableSize));
  }
}

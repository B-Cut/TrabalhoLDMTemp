import 'package:flutter/material.dart';

class GameField extends StatefulWidget {
  late String userName;
  late Icon userSymbol;
  late int tableSize;
  GameField(String username, String symbol, String size) {
    this.userName = username;
    this.userSymbol == "x"
        ? const Icon(Icons.close, color: Colors.blue)
        : const Icon(Icons.circle, color: Colors.blue);
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
    return Padding(
        padding: EdgeInsets.all(100),
        child: GridView.count(
          crossAxisCount: 2,
        ));
  }
}

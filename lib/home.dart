// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  String userName = "";
  bool gameStarted = false;
  String? symbolChoice;
  String? sizeChoice;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Jogo da Velha"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                decoration:
                    const InputDecoration(label: Text("Digite o seu apelido")),
                keyboardType: TextInputType.text,
                enabled: true,
                controller: _controller,
              ),
              Row(
                // TODO: Encapsular em um classe própria
                // Inicio dos radios do simbolo
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Selecione o seu símbolo:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 146, 0, 0),
                      ),
                      Radio(
                        value: "x",
                        groupValue: symbolChoice,
                        onChanged: (choice) {
                          setState(() {
                            symbolChoice = choice;
                          });
                        },
                        toggleable: true,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.indigo,
                      ),
                      Radio(
                        value: "o",
                        groupValue: symbolChoice,
                        onChanged: (choice) {
                          setState(() {
                            symbolChoice = choice;
                          });
                        },
                        toggleable: true,
                      ),
                    ],
                  )
                ],
              ), //Fim dos radios dos simbolos
              Row(
                // Inicio dos radios do tabuleiro
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Escolha o tamanho do tabuleiro:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Text("3x3"),
                      Radio(
                        value: "3",
                        groupValue: sizeChoice,
                        onChanged: (choice) {
                          setState(() {
                            sizeChoice = choice;
                          });
                        },
                        toggleable: true,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("4x4"),
                      Radio(
                        value: "4",
                        groupValue: sizeChoice,
                        onChanged: (choice) {
                          setState(() {
                            sizeChoice = choice;
                          });
                        },
                        toggleable: true,
                      ),
                    ],
                  )
                ],
              ), // Fim do radio dos tabuleiros
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userName = _controller.text;
                      print("Nome de Usuário: " + userName);
                      print("Escolha de simbolo: " + symbolChoice!);
                      print("Escolha de tamanho: " + sizeChoice!);
                    });
                  },
                  child: const Text("Iniciar Jogo."))
            ],
          ),
        ));
  }
}

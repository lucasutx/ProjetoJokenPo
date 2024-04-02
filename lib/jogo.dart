import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var imageApp = AssetImage('assets/images/padrao.png');
  var mensagem = 'Clque nos emojis para começar';

  void opcaoSelecionada(String escolha) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          imageApp = AssetImage('assets/images/pedra.png');
        });

        break;

      case 'papel':
        setState(() {
          imageApp = AssetImage('assets/images/papel.png');
        });

        break;

      case 'tesoura':
        setState(() {
          imageApp = AssetImage('assets/images/tesoura.png');
        });
        break;
    }

    if ((escolha == 'pedra' && escolhaApp == 'tesoura') ||
        (escolha == 'tesoura' && escolhaApp == 'papel') ||
        (escolha == 'papel' && escolhaApp == 'pedra')) {
      setState(() {
        this.mensagem = "Parabéns você ganhou";
      });
    } else if ((escolhaApp == 'pedra' && escolha == 'tesoura') ||
        (escolhaApp == 'tesoura' && escolha == 'papel') ||
        (escolhaApp == 'papel' && escolha == 'pedra')) {

          setState(() {
        this.mensagem = "Que pena, você perdeu";
      });
    } else {
      setState(() {
        this.mensagem = "Empate";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "JokenPo",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 113, 171, 201),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: this.imageApp,
                  height: 200,
                ),
                Text(this.mensagem),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        opcaoSelecionada('pedra');
                      },
                      child: Image.asset(
                        'assets/images/pedra.png',
                        height: 100,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        opcaoSelecionada('papel');
                      },
                      child: Image.asset(
                        'assets/images/papel.png',
                        height: 100,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        opcaoSelecionada('tesoura');
                      },
                      child: Image.asset(
                        'assets/images/tesoura.png',
                        height: 100,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:aula_um/telaDois.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imagemApp = 'assets/images/padrao.png';

  final List<String> opcoes = [
    'assets/images/pedra.png',
    'assets/images/papel.png',
    'assets/images/tesoura.png',
  ];

  void jogar(String escolhaJogador) {
    final random = Random();
    final escolhaDoApp = opcoes[random.nextInt(opcoes.length)];
    String resultado = 'empatou';

    if (escolhaJogador == escolhaDoApp) {
      resultado = 'empatou';
    } else if ((escolhaJogador == 'assets/images/pedra.png' &&
            escolhaDoApp == 'assets/images/tesoura.png') ||
        (escolhaJogador == 'assets/images/papel.png' &&
            escolhaDoApp == 'assets/images/pedra.png') ||
        (escolhaJogador == 'assets/images/tesoura.png' &&
            escolhaDoApp == 'assets/images/papel.png')) {
      resultado = 'venceu';
    } else {
      resultado = 'perdeu';
    }

    setState(() {
      imagemApp = escolhaDoApp;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaDois(
          escolhaApp: escolhaDoApp,
          escolhaJogador: escolhaJogador,
          resultado: resultado,
        ),
      ),
    ).then((_) {
      setState(() {
        imagemApp = 'assets/images/padrao.png';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF3B3B),
        title: const Text(
          'Pedra,Papel, Tesoura',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color(0xFFE9E9E9),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(imagemApp, height: 120, width: 120),
                  const SizedBox(height: 14),
                  const Text(
                    'Escolha do APP',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => jogar('assets/images/pedra.png'),
                    child: Image.asset(
                      'assets/images/pedra.png',
                      height: 86,
                      width: 86,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => jogar('assets/images/papel.png'),
                    child: Image.asset(
                      'assets/images/papel.png',
                      height: 86,
                      width: 86,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => jogar('assets/images/tesoura.png'),
                    child: Image.asset(
                      'assets/images/tesoura.png',
                      height: 86,
                      width: 86,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

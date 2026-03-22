import 'package:flutter/material.dart';

class TelaDois extends StatelessWidget {
  final String escolhaApp;
  final String escolhaJogador;
  final String resultado;

  const TelaDois({
    super.key,
    required this.escolhaApp,
    required this.escolhaJogador,
    required this.resultado,
  });

  String imagemResultado() {
    if (resultado == 'venceu') {
      return 'assets/images/icons8-vit\u00f3ria-48.png';
    } else if (resultado == 'perdeu') {
      return 'assets/images/icons8-perder-48.png';
    } else {
      return 'assets/images/icons8-aperto-de-m\u00e3os-100.png';
    }
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(escolhaApp, height: 120, width: 120),
                    const SizedBox(height: 14),
                    const Text(
                      'Escolha do APP',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    Image.asset(escolhaJogador, height: 120, width: 120),
                    const SizedBox(height: 14),
                    const Text(
                      'Sua Escolha',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Image.asset(
                      imagemResultado(),
                      width: 170,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Voce $resultado',
                      style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF1D1D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        'Jogar novamente',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

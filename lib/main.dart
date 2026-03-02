import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.purpleAccent),
      ),
      home: const MyHomePage(title: 'Primeira pagina'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,
    required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    Random random = new Random();
    setState(() {
        _counter = random.nextInt(4);
    });
  }

  @override
  Widget build(BuildContext context) {

    List<String>  listaTexto = ['Texto um', 'TExto dois' , 'Texto tres' , 'Texto quatro' ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 255, 0, 100),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(listaTexto[_counter]),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(onPressed: ()=>{
              setState(() {
                _counter = 0;
              })
            }, child: Text("Zerar o valor:")),
            Container(
              height: 150,
              padding: EdgeInsets.all(10),
              color: Colors.black,
              child: Image.asset('images/knuckles.webp'),
              margin: EdgeInsets.only(top: 20),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(255,0,0,0),
    );
  }
}

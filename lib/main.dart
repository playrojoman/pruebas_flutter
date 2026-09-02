import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
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
  int _counter = 0;
  final ApiService api = ApiService();

  void _incrementCounter() {
    setState(() {
      _counter++;
      //Ejemplos de como imprimir mensajes (developer.log no funciona con Logcat)
      //print('[INFO] Se crecio a $_counter');
      //debugPrint('Se aumentó a $_counter');
      //developer.log('Este es un mensaje de log', name: 'mi.app.tag');
    });
  }

  Future<void> manejarrespuesta() async{
    final respuesta = await api.obtenerRespuesta();
    
    debugPrint("[API] Respuesta: ${respuesta}");
    debugPrint("[API] Estatus: ${respuesta['ok']}");
    debugPrint("[API] La API dice que: ${respuesta['mensaje']}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Picale ahí mero:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        onPressed: manejarrespuesta,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

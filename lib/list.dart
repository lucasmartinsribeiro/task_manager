import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navegação Básica',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const SegundaRota(),
    debugShowCheckedModeBanner: false,
  ));
}

class SegundaRota extends StatelessWidget {
  const SegundaRota({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Center(
        child: botaoSegundaRota(context),
      ),
    );
  }
}

ElevatedButton botaoSegundaRota(BuildContext context) {
  return ElevatedButton(
      child: const Text("Back"),
      onPressed: () {
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => const SegundaRota()),
        );
      });
}

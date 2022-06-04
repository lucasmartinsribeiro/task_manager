import 'package:task_manager/list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navegação Básica',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const PrimeiraRota(),
    debugShowCheckedModeBanner: false,
  ));
}

class PrimeiraRota extends StatelessWidget {
  const PrimeiraRota({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            chamarTela(context, const SegundaRota());
          },
          child: const Text('Add'),
        ),
      ),
    );
  }
}

chamarTela(BuildContext context, StatelessWidget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

import 'package:task_manager/form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation',
    theme: ThemeData(primarySwatch: Colors.red),
    home: const MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            chamarTela(context, MyTask());
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

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          callScreen(context, MyTask());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

callScreen(BuildContext context, StatelessWidget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

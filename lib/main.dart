import 'package:task_manager/form.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/list.dart';
import 'package:task_manager/task.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation',
    theme: ThemeData(primarySwatch: Colors.red),
    home: const MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List <Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: ListView(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          children: [
            for(Task task in tasks)
              MyList(
                task: task
              ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          callScreen(context, const MyTask());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

callScreen(BuildContext context, StatefulWidget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}
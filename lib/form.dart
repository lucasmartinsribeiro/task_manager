import 'package:flutter/material.dart';
import 'task.dart';

void main() => runApp(MaterialApp(
    title: 'Navegação Básica',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: MyTask(),
    debugShowCheckedModeBanner: false,
));

class MyTask extends StatelessWidget {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerCalendar = TextEditingController();

  MyTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de tarefa'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controllerTitle,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField( 
                  controller: _controllerDescription,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controllerCalendar,
                  decoration: InputDecoration(labelText: 'Calendar'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  child: Text('Salvar'),
                onPressed: () {
                  final String title = _controllerTitle.text;
                  final String description = _controllerDescription.text;
                  final String calendar = _controllerCalendar.text;

                  final Task newTask = Task(title, description, calendar);
                  print(newTask);
                },
                ),
              ),
            ],
          ),
        ),
    );
  }
}

ElevatedButton buttonBack(BuildContext context) {
  return ElevatedButton(
      child: const Text("Back"),
      onPressed: () {
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => MyTask()),
        );
      });
}
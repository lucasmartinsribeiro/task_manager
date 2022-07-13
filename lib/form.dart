import 'package:flutter/material.dart';
import 'package:task_manager/main.dart';
import 'package:intl/intl.dart';
import 'task.dart';
import 'database.dart';

void main() => runApp(const MaterialApp(
      title: 'Navigation',
      home: MyTask(),
      debugShowCheckedModeBanner: false,
    ));

class MyTask extends StatefulWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  final TextEditingController _controllerTitle = TextEditingController();

  final TextEditingController _controllerCalendar = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Nova Tarefa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controllerTitle,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                  controller: _controllerCalendar,
                  decoration: const InputDecoration(labelText: 'Data Limite'),
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2050));
                    _controllerCalendar.text =
                        DateFormat('dd/MM/yyyy').format(date!);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {
                  final String title = _controllerTitle.text;
                  final String calendar = _controllerCalendar.text;

                  if ((title != "") && (calendar != "")) {
                    Database db = Database();
                    db.include(Task(title, calendar));
                    Navigator.pop(context);

                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                title: const Text('Salvo'),
                                content: const Text(
                                    'A tarefa foi salva com sucesso!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => {
                                      callScreen(context, const MyHomePage())
                                    },
                                    child: const Text('Ok'),
                                  )
                                ]));
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                title: const Text('Campos Vazios'),
                                content: const Text(
                                    'Por favor, preencha todos os campos!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        {callScreen(context, const MyTask())},
                                    child: const Text('Ok'),
                                  )
                                ]));
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          callScreen(context, const MyHomePage());
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_manager/main.dart';
import 'taskController.dart';

void main() => runApp(MaterialApp(
    title: 'Navigation',
    theme: ThemeData(primarySwatch: Colors.red),
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
          title: const Text('Task Registration'),
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
                  child: Text('Save'),
                onPressed: () {
                  final String title = _controllerTitle.text;
                  final String description = _controllerDescription.text;
                  final String calendar = _controllerCalendar.text;

                  // final Task newTask = Task(title, description, calendar);
                  // print(newTask);

                  print(TaskController.persist(title, description, calendar));

                  showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                    title: const Text ('Success'),
                    content: const Text('Saved successfully'),
                    actions: <Widget>[
                      TextButton(onPressed: () => {callScreen(context, MyHomePage())}, 
                        child: const Text('Ok'),
                      )
                    ]
                  ));
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
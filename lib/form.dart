import 'package:flutter/material.dart';
import 'package:task_manager/main.dart';
import 'task_controller.dart';
import 'task.dart';
import 'main.dart';

void main() => runApp(MaterialApp(
    title: 'Navigation',
    theme: ThemeData(primarySwatch: Colors.red),
    home: const MyTask(),
    debugShowCheckedModeBanner: false,
));

class MyTask extends StatefulWidget {

  const MyTask({Key? key}) : super(key: key);

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  final TextEditingController _controllerTitle = TextEditingController();

  final TextEditingController _controllerDescription = TextEditingController();

  final TextEditingController _controllerCalendar = TextEditingController();

  List <Task> tasks = [];

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
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField( 
                  controller: _controllerDescription,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controllerCalendar,
                  decoration: const InputDecoration(labelText: 'Calendar'),
                  // keyboardType: TextInputType.number,
                  onTap: () async {
                    var date = await showDatePicker(context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2022), lastDate: DateTime(2050)
                    );
                    _controllerCalendar.text = date.toString();
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  child: const Text('Save'),
                onPressed: () {
                  String title = _controllerTitle.text;
                  String description = _controllerDescription.text;
                  String calendar = _controllerCalendar.text;
                  
                  // print(TaskController.persist(title, description, calendar));

                  // if ((title != "") && (description != "") && (calendar != "")) {
                  //     TaskController.list.add(Task(title, description, calendar));
                  // }

                  

                  setState(() {
                    Task newTask = Task(
                      title: title,
                      description: description,
                      calendar: calendar,
                    );
                    tasks.add(newTask);
                  });

                  // TaskController.clear();

                  showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                    title: const Text ('Success'),
                    content: const Text('Saved successfully'),
                    actions: <Widget>[
                      TextButton(onPressed: () => {callScreen(context, const MyHomePage())}, 
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
        MaterialPageRoute(builder: (context) => const MyTask()),
      );
    }
  );
}
import 'package:task_manager/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'task_controller.dart';
import 'form.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: const [Locale('pt', 'BR')],
    title: 'Navigation',
    theme: ThemeData(primarySwatch: Colors.teal),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(50.0),
          child: ListView.builder(
            itemBuilder: (BuildContext, index) {
              return Card(
                color: Colors.teal.shade50,
                child: ListTile(
                  title: Text(TaskController.list[index].title),
                  subtitle: Text(TaskController.list[index].calendar),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.delete)),
                    ],
                  ),
                ),
              );
            },
            itemCount: TaskController.list.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
          )),
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
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false,
  );
}

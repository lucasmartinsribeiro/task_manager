import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:task_manager/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'form.dart';
import 'database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
  Database db = Database();
  List docs = [];

  initialise() {
    db.initiliase();
    db.list().then((value) => {
      setState(() {
        docs = value;
        })
      });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  void _openForm(Map taskSelec) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyTask(
            taskSelected: taskSelec,
            )
          )
        ).then((_) {
          setState(() {
            initialise();
          }
        );
      }
    );
  }

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
                  title: Text(docs[index]['title']),
                  subtitle: Text(docs[index]['calendar']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          print("docs[index]---> $docs[index]['id']");
                          Map<String, String> task() => {
                            "id": docs[index]['id'],
                            "title": docs[index]['title'],
                            "calendar": docs[index]['calendar']
                          };
                          _openForm(task());
                        }, icon: const Icon(Icons.edit)),
                      IconButton(
                        onPressed: () {
                          db.delete(docs[index]['id']);
                            setState(() {
                              initialise();
                            });
                        }, icon: const Icon(Icons.delete)),
                    ],
                  ),
                ),
              );
            },
            itemCount: docs.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // callScreen(context, MyTask());
          Map<String, String> mapNulo() => {"title": "", "calendar": ""};
          _openForm(mapNulo());
        },
        // onPressed: _openForm,
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

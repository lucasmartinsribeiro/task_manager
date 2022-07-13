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
    db.listar().then((value) => {
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

  void _openForm() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MyTask())).then((_) {
      setState(() {
        initialise();
      });
    });
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
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) =>
                  //         View(country: docs[index], db: db)))
                  //         .then((value) => {
                  //           if (value != null) {initialise()}
                  //           });
                  // },
                  // onLongPress: () {
                  //   db.delete(docs[index]['id']);
                  //   setState(() {
                  //     initialise();
                  //   });
                  // },
                  title: Text(docs[index]['title']),
                  subtitle: Text(docs[index]['calendar']),
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
            itemCount: docs.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          callScreen(context, const MyTask());
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

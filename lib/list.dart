import 'task_controller.dart';
import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: ListView.builder(
          itemBuilder: (BuildContext, index) {
            return Card(
              child: ListTile(
                title: Text(TaskController.list[index].title),
                subtitle: Text(TaskController.list[index].description),
                // calendar: Text(TaskController.list[index].calendar),
              ),
            );
          },
          itemCount: TaskController.list.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
        )
      )
    );
  }
}

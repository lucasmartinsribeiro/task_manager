import 'task.dart';

class TaskController {
  static Task persist(String title, String calendar) {
    Task t = Task(title, calendar);

    //At this point would be the code for persistence in the database
    return t;
  }

  static List<Task> list = [];

  static include(Task t) {
    list.add(t);
  }

  static List<Task> tasks() {
    return list;
  }
}

import 'task.dart';

class TaskController {
  static Task persist(String title, String description, String calendar) {
    Task t = Task(title, description, calendar);

    //At this point would be the code for persistence in the database
    return t;
  }
}
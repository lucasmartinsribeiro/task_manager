class Task {
  final String title;
  final String calendar;

  Task(
    this.title,
    this.calendar,
  );

  @override
  String toString() {
    return 'Task{title: $title, calendar: $calendar}';
  }  
}
class Task {
  final String title;
  final String description;
  final String calendar;

  Task(
    this.title,
    this.description,
    this.calendar,
  );

  @override
  String toString() {
    return 'Task{title: $title, description: $description, calendar: $calendar}';
  }  
}
class Task {
  String id;
  String title;
  String description;
  bool isDone;
  int date;
  Task(
      {required this.title,
      required this.description,
      required this.date,
      this.id = '',
      this.isDone = false});

  Task.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          isDone: json['isDone'] as bool,
          date: json['data'] as int,
        );

  Map<String, dynamic> toJson() {
    // to firebase
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'data': date,
    };
  }
}

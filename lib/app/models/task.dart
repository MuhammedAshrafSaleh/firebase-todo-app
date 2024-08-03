class Task {
  // 1. Properties
  // 2. Writing Data [ Make Object Convert It => Json(Map) ]
  // 3. Reading Data [ Get Json Convert It => Object ]
  // Collection Name
  static const String collectionName = 'tasks';
  // 1. Properties
  String? id;
  String? title;
  String? description;
  DateTime? date;
  bool? isDone;

  Task({
    this.id = '',
    required this.title,
    required this.description,
    required this.date,
    this.isDone = false,
  });
  // 2. Adding Data Writing Data [ Make Object Convert It => Json(Map) ]
  // Task.fromName => Called Named Constructor
  // :this called the instructor
  Task.fromFirestore(Map<String?, dynamic> data)
      : this(
          id: data['id'] as String,
          title: data['title'] as String,
          description: data['description'] as String,
          date: DateTime.fromMillisecondsSinceEpoch(data['date']),
          isDone: data['isDone'] as bool,
        );

  // 3. Getting Data "Reading Data [ Get Json Convert It => Object ]"
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date
          ?.millisecondsSinceEpoch, // TODO: To Easily Change and make Operations on the time
      'isDone': isDone,
    };
  }
}

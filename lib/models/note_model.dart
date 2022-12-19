
class Note {
  String? id;
  String? title;
  String? content;
  String? noteColor;
  bool? isDone;
  String? onCreateDate;

  Note({
    required this.id,
    required this.title,
    this.content = '',
    this.noteColor = '0xffFFCC80',
    this.isDone = false,
    this.onCreateDate,
  });

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    noteColor = json['color'];
    isDone = json['isDone'];
    onCreateDate = json['onCreateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['color'] = noteColor;
    data['isDone'] = isDone;
    data['onCreateDate'] = onCreateDate;
    return data;
  }
}

class DiaryNote {
  final String? title;
  final String? desc;
  final DateTime? date;
  final String? images;

  DiaryNote({this.title, this.desc, this.date, this.images});

  factory DiaryNote.fromJson(Map<String,dynamic> json) => DiaryNote(
    title: json['title'],
    desc: json['desc'],
    date: json['date'],
    images: json['images']
  );

}


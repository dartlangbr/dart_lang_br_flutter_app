class Comment {
  String author;
  String date;
  String content;

  Comment({this.author, this.date, this.content});

  Comment.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    date = json['date'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['date'] = this.date;
    data['content'] = this.content;
    return data;
  }
}
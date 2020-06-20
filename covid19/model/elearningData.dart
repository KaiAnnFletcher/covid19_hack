class ElearningData {
  String category;
  String title;
  String summary;
  String link;
  String author;

  ElearningData(
      {this.category, this.title, this.summary, this.link, this.author});

  ElearningData.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    title = json['title'];
    summary = json['summary'];
    link = json['link'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['link'] = this.link;
    data['author'] = this.author;
    return data;
  }
}
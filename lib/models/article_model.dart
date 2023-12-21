import 'dart:convert';

class ArticleModel {
  String uid;
  String title;
  String content;
  String? coverImg;
  String authorUid;
  String authorImg;
  DateTime createdAt;
  int claps;
  int views;
  ArticleModel({
    required this.uid,
    required this.title,
    required this.content,
    this.coverImg,
    required this.authorUid,
    required this.authorImg,
    required this.createdAt,
    required this.claps,
    required this.views,
  });

  ArticleModel copyWith({
    String? uid,
    String? title,
    String? content,
    String? coverImg,
    String? authorUid,
    String? authorImg,
    DateTime? createdAt,
    int? claps,
    int? views,
  }) {
    return ArticleModel(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      content: content ?? this.content,
      coverImg: coverImg ?? this.coverImg,
      authorUid: authorUid ?? this.authorUid,
      authorImg: authorImg ?? this.authorImg,
      createdAt: createdAt ?? this.createdAt,
      claps: claps ?? this.claps,
      views: views ?? this.views,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'title': title,
      'content': content,
      'coverImg': coverImg,
      'authorUid': authorUid,
      'authorImg': authorImg,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'claps': claps,
      'views': views,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      uid: map['uid'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      coverImg: map['coverImg'] != null ? map['coverImg'] as String : null,
      authorUid: map['authorUid'] as String,
      authorImg: map['authorImg'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      claps: map['claps'] as int,
      views: map['views'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) => ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArticleModel(uid: $uid, title: $title, content: $content, coverImg: $coverImg, authorUid: $authorUid, authorImg: $authorImg, createdAt: $createdAt, claps: $claps, views: $views)';
  }

  @override
  bool operator ==(covariant ArticleModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.title == title &&
      other.content == content &&
      other.coverImg == coverImg &&
      other.authorUid == authorUid &&
      other.authorImg == authorImg &&
      other.createdAt == createdAt &&
      other.claps == claps &&
      other.views == views;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      title.hashCode ^
      content.hashCode ^
      coverImg.hashCode ^
      authorUid.hashCode ^
      authorImg.hashCode ^
      createdAt.hashCode ^
      claps.hashCode ^
      views.hashCode;
  }
}

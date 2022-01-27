import 'dart:convert';

class Review {
  final String id;
  final String reviewer;
  final String comment;
  Review(this.id, this.reviewer, this.comment);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'reviewer': reviewer,
      'comment': comment,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      map['id'] ?? '',
      map['reviewer'] ?? '',
      map['comment'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) => Review.fromMap(json.decode(source));
}

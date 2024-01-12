import 'package:unieduc/Model/Ue.dart';

class Niveau {
  int id;
  int like;
  int commentaire;
  String title;
  String contenenu;
  String image;

  Niveau(
      {required this.id,
      required this.like,
      required this.commentaire,
      required this.title,
      required this.contenenu,
      required this.image});

  factory Niveau.fromJson(Map<String, dynamic> json) {
    return Niveau(
      id: json != null ? json['idNiveau'] : null,
      like: json != null ? json['like'] : null,
      commentaire: json != null ? json['commentaire'] : null,
      title: json != null ? json['title'] : null,
      contenenu: json != null ? json['contenenu'] : null,
      image: json != null ? json['image'] : null,
    );
  }
}

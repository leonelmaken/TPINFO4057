import 'package:unieduc/Model/Ue.dart';

class Annonce {
  int id;
  int like;
  int commentaire;
  String title;
  String contenenu;
  String image;

  Annonce(
      {required this.id,
      required this.like,
      required this.commentaire,
      required this.title,
      required this.contenenu,
      required this.image});

  factory Annonce.fromJson(Map<String, dynamic> json) {
    return Annonce(
      id: json != null ? json['idAnnonce'] : null,
      like: json != null ? json['like'] : null,
      commentaire: json != null ? json['commentaire'] : null,
      title: json != null ? json['title'] : null,
      contenenu: json != null ? json['contenenu'] : null,
      image: json != null ? json['image'] : null,
    );
  }
}

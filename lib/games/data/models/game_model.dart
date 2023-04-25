import 'package:games/games/domain/entities/game_entitie.dart';

class GameModel extends Game {
  GameModel(
      {super.id,
      required super.title,
      required super.thumbnail,
      required super.short_description,
      required super.genre,
      required super.developer,
      required super.release_date});

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
        id: json['id'],
        title: json['title'],
        thumbnail: json['thumbnail'],
        short_description: json['short_description'],
        genre: json['genre'],
        developer: json['developer'],
        release_date: json['release_date']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'short_description': short_description,
      'genre': genre,
      'developer': developer,
      'release_date': release_date,
    };
  }
}

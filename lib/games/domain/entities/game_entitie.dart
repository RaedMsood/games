import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final int? id;
  final String title;
  final String thumbnail;
  final String short_description;
  final String genre;
  final String developer;
  final String release_date;

  Game(
      {this.id,
      required this.title,
      required this.thumbnail,
      required this.short_description,
      required this.genre,
      required this.developer,
      required this.release_date});

  @override
  List<Object?> get props =>
      [id, title, thumbnail, short_description, genre, developer, release_date];
}

import 'dart:convert';

import 'package:games/core/error/exception.dart';
import 'package:games/games/data/models/game_model.dart';
import 'package:http/http.dart' as http;

abstract class GameRemoteDataSource {
  Future<List<GameModel>> getAllGames();
}

const BASE_URL = "https://www.freetogame.com/api/games";

class GameRemoteDataSourceImpl implements GameRemoteDataSource {
  final http.Client client;

  GameRemoteDataSourceImpl({required this.client});

  @override
  Future<List<GameModel>> getAllGames() async {
    final response = await client.get(
      Uri.parse(BASE_URL ),
      headers: {"Content_Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<GameModel> gameModels = decodedJson
          .map<GameModel>((jsonGameModel) => GameModel.fromJson(jsonGameModel))
          .toList();
      return gameModels;
    } else {
      throw ServerException();
    }
  }
}

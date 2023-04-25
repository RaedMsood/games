import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:games/core/error/exception.dart';
import 'package:games/games/data/models/game_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GameLocalDataSource {
  Future<List<GameModel>> getCachedGames();

  Future<Unit> cacheGames(List<GameModel> gameModels);
}

class GameLocalDataSourceImpl implements GameLocalDataSource {
  final SharedPreferences sharedPreferences;

  GameLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheGames(List<GameModel> gameModels) {
    List gameModelsToJson = gameModels
        .map<Map<String, dynamic>>((gameModel) => gameModel.toJson())
        .toList();
    sharedPreferences.setString("CACHED_GAMES", json.encode(gameModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<GameModel>> getCachedGames() {
    final jsonString = sharedPreferences.getString("CACHED_GAMES");
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<GameModel> jsonToGameModels = decodeJsonData
          .map<GameModel>((jsonGameModel) => GameModel.fromJson(jsonGameModel))
          .toList();
      return Future.value(jsonToGameModels);
    } else {
      throw EmptyCacheException();
    }
  }
}

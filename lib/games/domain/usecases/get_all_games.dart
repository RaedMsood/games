import 'package:dartz/dartz.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/games/domain/repositories/games_repositories.dart';

import '../entities/game_entitie.dart';

class GetAllGamesUserCase {
  final GamesRepositories repositories;

  GetAllGamesUserCase({required this.repositories});

  Future<Either<Failure, List<Game>>> call() async {
    return await repositories.getAllGames();
  }
}

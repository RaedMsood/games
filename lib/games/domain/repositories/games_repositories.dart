import 'package:dartz/dartz.dart';
import 'package:games/core/error/failure.dart';

import '../entities/game_entitie.dart';

abstract class GamesRepositories{
  Future<Either<Failure,List<Game>>> getAllGames();
}
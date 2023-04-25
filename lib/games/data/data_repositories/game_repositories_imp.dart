import 'package:dartz/dartz.dart';
import 'package:games/core/error/exception.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/core/error/network/network_info.dart';
import 'package:games/games/domain/entities/game_entitie.dart';
import 'package:games/games/domain/repositories/games_repositories.dart';

import '../data_source/game_local_data_source.dart';
import '../data_source/game_remote_data_source.dart';

class GamesRepositoryImpl implements GamesRepositories {
  final GameRemoteDataSource remoteDataSource;
  final GameLocalDataSource localDataSource;
  final NetWorkInfo netWorkInfo;

  GamesRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.netWorkInfo});

  @override
  Future<Either<Failure, List<Game>>> getAllGames() async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteGames = await remoteDataSource.getAllGames();
        localDataSource.cacheGames(remoteGames);
        return Right(remoteGames);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localGames = await localDataSource.getCachedGames();
        return Right(localGames);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}

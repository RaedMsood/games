import 'package:games/core/error/network/network_info.dart';
import 'package:games/games/data/data_repositories/game_repositories_imp.dart';
import 'package:games/games/data/data_source/game_local_data_source.dart';
import 'package:games/games/data/data_source/game_remote_data_source.dart';
import 'package:games/games/domain/repositories/games_repositories.dart';
import 'package:games/games/domain/usecases/get_all_games.dart';
import 'package:games/games/presentation/bloc_games/games_bloc.dart';
import 'package:games/games/presentation/riverpod_games/games_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc

  sl.registerFactory(() => GamesBloc(getAllGames: sl()));

  // UseCases

  sl.registerLazySingleton(() => GetAllGamesUserCase(repositories: sl()));
  sl.registerLazySingleton(() => GamesNotifier(getAllGamesUserCase: sl()));
  // Repository

  sl.registerLazySingleton<GamesRepositories>(() => GamesRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), netWorkInfo: sl()));

  // DataSources

  sl.registerLazySingleton<GameRemoteDataSource>(() => GameRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GameLocalDataSource>(
      () => GameLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core

  sl.registerLazySingleton<NetWorkInfo>(() => NetWorkInfoImpl(sl()));


  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

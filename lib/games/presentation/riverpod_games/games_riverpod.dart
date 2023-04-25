import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/core/string/failure.dart';
import 'package:games/games/domain/usecases/get_all_games.dart';
import 'package:games/injection_container.dart' as di;
import 'games_state.dart';

final gameProvider = StateNotifierProvider<GamesNotifier, GamesState>(
    (ref) => GamesNotifier(getAllGamesUserCase: di.sl()));

class GamesNotifier extends StateNotifier<GamesState> {
  final GetAllGamesUserCase getAllGamesUserCase;

  GamesNotifier({required this.getAllGamesUserCase}) : super(GamesInitial());

  fetchGame() async {
    state = LoadingGamesState();
    final games = await getAllGamesUserCase.call();
    games.fold((failure) {
      state = ErrorGamesState(message: mapFailureToMessage(failure));
    }, (game) {
      state = LoadedGamesState(games: game);
    });
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}

class ChangeBottomNav extends StateNotifier<int> {
  ChangeBottomNav() : super(0);

  void changeBottom(int index) {
    state = index;
  }
}

final gameChangeMode =
    StateNotifierProvider<AppChangeMode, GamesState>((ref) => AppChangeMode());

class AppChangeMode extends StateNotifier<GamesState> {
  AppChangeMode() : super(GamesInitial());
  bool isDark = true;

  changeMode() {
    isDark = !isDark;
    state = AppChangModeState();
  }
}

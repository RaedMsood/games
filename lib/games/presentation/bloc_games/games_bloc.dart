import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/core/string/failure.dart';
import 'package:games/games/domain/entities/game_entitie.dart';
import 'package:games/games/domain/usecases/get_all_games.dart';
import 'package:games/games/presentation/bloc_games/games_event.dart';
import 'package:games/games/presentation/bloc_games/games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GetAllGamesUserCase getAllGames;

  bool isDark = true;

  static GamesBloc get(context) => BlocProvider.of(context);

  GamesBloc({required this.getAllGames}) : super(GamesInitial()) {
    on<GamesEvent>((event, emit) async {
      if (event is GetAllGamesEvent) {
        emit(LoadingGamesState());
        final games = await getAllGames();
        games.fold((failure) {
          emit(ErrorGamesState(message: mapFailureToMessage(failure)));
        }, (games) {
          emit(LoadedGamesState(games: games));
        });
      } else if (event is AppChangModeEvent) {
        isDark = !isDark;
        log('--------------------change --------------');
        emit(AppChangModeState(isDark: isDark));
      }
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

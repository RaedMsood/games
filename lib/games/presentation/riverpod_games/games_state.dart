import 'package:equatable/equatable.dart';
import 'package:games/games/domain/entities/game_entitie.dart';

abstract class GamesState extends Equatable {
  const GamesState();

  @override
  List<Object?> get props => [];
}

class GamesInitial extends GamesState {}

class LoadingGamesState extends GamesState {}

class LoadedGamesState extends GamesState {
  final List<Game> games;

  LoadedGamesState({required this.games});

  @override
  List<Object?> get props => [games];
}

class ErrorGamesState extends GamesState {
  final String message;

  ErrorGamesState({required this.message});

  @override
  List<Object?> get props => [message];
}

class AppChangModeState extends GamesState {}


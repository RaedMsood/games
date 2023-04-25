import 'package:equatable/equatable.dart';

abstract class GamesEvent extends Equatable {
  const GamesEvent();

  @override
  List<Object?> get props => [];
}

class GetAllGamesEvent extends GamesEvent{}

class AppChangModeEvent extends GamesEvent {}


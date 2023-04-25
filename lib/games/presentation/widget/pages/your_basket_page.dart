import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games/core/widget/loading_widget.dart';
import 'package:games/games/presentation/riverpod_games/games_riverpod.dart';
import 'package:games/games/presentation/riverpod_games/games_state.dart';
import 'package:games/games/presentation/widget/games_page/your_basket_widget.dart';
import 'package:games/games/presentation/widget/games_page/message_display_widget.dart';

class ImageGamesPage extends ConsumerWidget {
  const ImageGamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
        builder: ((BuildContext context, WidgetRef ref, Widget? child) {
      GamesState state = ref.watch(gameProvider);
      if (state is LoadingGamesState) {
        return  LoadingWidget();
      } else if (state is LoadedGamesState) {
        return YourBasketWidget(
          games: state.games,
        );
      } else if (state is ErrorGamesState) {
        return MessageDisplayWidget(
          message: state.message,
        );
      }
      return  LoadingWidget();
    }));
  }
}

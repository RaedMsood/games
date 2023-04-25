import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games/core/widget/app_ber_widget.dart';

import 'package:games/games/presentation/bloc_games/games_bloc.dart';
import 'package:games/games/presentation/bloc_games/games_event.dart';
import 'package:games/games/presentation/riverpod_games/games_riverpod.dart';
import 'package:games/games/presentation/widget/pages/your_basket_page.dart';

import 'game_home_page.dart';

final selectedItemProvider =
    StateNotifierProvider<ChangeBottomNav, int>((ref) => ChangeBottomNav());

class GamesChangeBottomNav extends ConsumerWidget {
  GamesChangeBottomNav({Key? key}) : super(key: key);

  final List<Widget> bottomScreen = [
    GameHomePage(),
    ImageGamesPage(),
  ];

  @override
  Widget build(BuildContext context, ref) {
    final selectedItem = ref.watch(selectedItemProvider);
    return Scaffold(
      appBar: AppBarWidget(),
      body: bottomScreen[selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0 || index == 1) {
            ref.read(gameProvider.notifier).fetchGame();
            ref.read(selectedItemProvider.notifier).state = index;
          } else {
            index = 0;
          }
        },
        currentIndex: selectedItem,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 38,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_basket,
              size: 38,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.other_houses_sharp,
              size: 38,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 38,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

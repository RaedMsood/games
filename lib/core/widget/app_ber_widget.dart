import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games/games/presentation/riverpod_games/games_riverpod.dart';
import 'package:games/games/presentation/widget/pages/games_change_bottom_nav_page.dart';

import 'loading_widget.dart';

AppBar AppBarWidget() {
  return AppBar(
    title: Consumer(
      builder: (context, ref, child) {
        return ref.read(selectedItemProvider.notifier).state == 0
            ? Text(
                "Home",
                style: TextStyle(fontSize: 23),
              )
            : Text(
                "Your basket",
                style: TextStyle(fontSize: 23),
              );
      },
    ),
    actions: [
      Consumer(
        builder: (context, ref, child) {
          return ref.read(selectedItemProvider.notifier).state == 0
              ? Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: IconButton(
                      splashRadius: 22,
                      onPressed: () {
                        ref.read(gameChangeMode.notifier).changeMode();
                      },
                      icon: Icon(
                        Icons.nights_stay,
                        size: 26,
                      )),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 17.0),
                  child: Icon(
                    Icons.menu_outlined,
                    size: 26,
                  ),
                );
        },
      )
    ],
    elevation: 0,
  );
}



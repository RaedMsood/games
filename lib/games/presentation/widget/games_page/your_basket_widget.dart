import 'package:flutter/material.dart';
import 'package:games/core/widget/cached_network_image_widget.dart';
import 'package:games/games/domain/entities/game_entitie.dart';
import 'package:games/games/presentation/widget/pages/game_detail_page.dart';

class YourBasketWidget extends StatelessWidget {
  final List<Game> games;

  const YourBasketWidget({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.count(
          physics: BouncingScrollPhysics(),
          shrinkWrap: false,
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 14,
          childAspectRatio: .9 / 1.0,
          children: List.generate(
              games.length, (index) => ImageGamesContainer(index, context))),
    );
  }

  Widget ImageGamesContainer(int index, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameDetailPage(game: games[index]),
              ));
        },
        child: cachedNetworkImage(
          image: games[index].thumbnail,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}

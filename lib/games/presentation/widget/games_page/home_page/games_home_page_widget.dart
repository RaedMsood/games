import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games/games/domain/entities/game_entitie.dart';
import 'package:games/games/presentation/riverpod_games/games_riverpod.dart';
import 'package:games/games/presentation/widget/games_page/home_page/most_recommended_and_you_may like_games.dart';
import 'package:games/games/presentation/widget/games_page/home_page/price_off_games.dart';
import 'package:games/games/presentation/widget/pages/game_home_page.dart';

class GamesHomePageWidget extends StatefulWidget {
  final List<Game> games;

  const GamesHomePageWidget({Key? key, required this.games}) : super(key: key);

  @override
  State<GamesHomePageWidget> createState() => _GamesHomePageState();
}

class _GamesHomePageState extends State<GamesHomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
              top: 10,
              left: 20,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Type here...',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 50.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Most recommended",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    MostRecommendedGamesAndYouMayLikeGames(
                        image: widget.games[index].thumbnail),
                separatorBuilder: (context, index) => SizedBox(
                      width: 0,
                    ),
                itemCount: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Price off games",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    PriceOffGames(image: widget.games[index].thumbnail),
                separatorBuilder: (context, index) => SizedBox(
                      width: 0,
                    ),
                itemCount: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "You may like",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    MostRecommendedGamesAndYouMayLikeGames(
                        image: widget.games[index].thumbnail),
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games/games/domain/entities/game_entitie.dart';
import 'package:games/games/presentation/bloc_games/games_bloc.dart';
import 'package:games/games/presentation/bloc_games/games_state.dart';
import 'package:games/games/presentation/riverpod_games/games_riverpod.dart';

class GameDetailPage extends StatelessWidget {
  final Game game;

  const GameDetailPage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(game.thumbnail),
                      fit: BoxFit.fill,
                      colorFilter:
                      ColorFilter.mode(Colors.black26, BlendMode.darken),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_sharp,
                                  size: 30,
                                  color: Colors.white,
                                )),
                            Spacer(),
                            Icon(
                              Icons.linear_scale,
                              size: 30,
                              color: Colors.white,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 100.0, left: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                game.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                    color: Colors.white),
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.white38,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "\$55.99",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.heart_broken_outlined,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 280.0),
                  child: Consumer(
                    builder: (context, ref, child) {

                     return Container(
                        width: double.infinity,
                        height: 500,
                        decoration: BoxDecoration(
                          color: ref.read(gameChangeMode.notifier).isDark?
                          Colors.grey[100]:Colors.grey[900],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: game.short_description,
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 15)),
                                    TextSpan(
                                        text: ' See more',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,color: Colors.purple)),
                                  ])),
                              SizedBox(
                                height: 15,
                              ),
                              Divider(thickness: 1),
                              SizedBox(
                                height: 15,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'DEVELOPER: ',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[500])),
                                    TextSpan(
                                        text: game.developer,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.purple[800],
                                        )),
                                    TextSpan(
                                        text: '\t\t\t\t\t\t\t\t\t\t GENRE: ',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[500])),
                                    TextSpan(
                                        text: game.genre,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.purple[800],
                                        )),
                                  ])),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'RELEASE DATE: ',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[500])),
                                    TextSpan(
                                        text: game.release_date,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.purple[800],
                                        )),
                                    TextSpan(
                                        text:
                                        '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t REVIEWS: ',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[500])),
                                    TextSpan(
                                        text: '(21,214)',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.purple[800],
                                        )),
                                  ])),
                              SizedBox(
                                height: 15,
                              ),
                              Divider(thickness: 1),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      );

                    }
                  ),

                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
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

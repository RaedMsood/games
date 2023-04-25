import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:games/games/domain/entities/game_entitie.dart';

class PriceOffGames extends StatelessWidget {
  final String image;

  const PriceOffGames({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
      child: Container(
        height: 250,
        width: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '\$49.99 ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    )),
                const TextSpan(
                    text: '-50% \n',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple)),
                const TextSpan(
                    text: '\$24.99',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ])),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0, right: 15),
                child: Container(
                    height: 40.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Center(
                        child: Text(
                      "Buy",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:games/core/widget/cached_network_image_widget.dart';

class MostRecommendedGamesAndYouMayLikeGames extends StatelessWidget {
  final String image;

  const MostRecommendedGamesAndYouMayLikeGames({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: cachedNetworkImage(
          image: image,
          height: 200,
          width: 300,
        ),
      ),
    );
  }
}

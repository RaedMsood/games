import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading_widget.dart';

CachedNetworkImage cachedNetworkImage(
    {required String image, double? width, double? height}) {
  return CachedNetworkImage(
    height: height,
    width: width,
    fit: BoxFit.cover,
    imageUrl: image,
    placeholder: (context, url) => LoadingWidget(),
    errorWidget: (context, url, error) => const Icon(
      Icons.error,
      color: Colors.red,
    ),
  );
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserImageCard extends StatelessWidget {
  final image;

  UserImageCard({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return CachedNetworkImage(
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      height: screenSize.height,
      width: screenSize.width,
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover,
      imageUrl: image ?? '',
    );
  }
}
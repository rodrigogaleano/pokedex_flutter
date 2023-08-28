import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../style/app_assets.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double borderRadius;

  const CachedImage({
    required this.url,
    super.key,
    this.width,
    this.height,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (_, imageProvider) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image(
            width: width,
            height: height,
            fit: BoxFit.cover,
            image: imageProvider,
          ),
        );
      },
      errorWidget: (_, __, ___) {
        return Image.asset(
          AppAssets.icPlaceholder,
          width: width,
          height: height,
          fit: BoxFit.cover,
        );
      },
    );
  }
}

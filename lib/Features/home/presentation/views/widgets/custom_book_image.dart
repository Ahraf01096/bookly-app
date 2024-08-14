import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_error_image_widget.dart';
import '../../../../../core/widgets/shimmer_featured.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: ClipRRect(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
                placeholder: (context, url) => SizedBox(height: MediaQuery.of(context).size.height *0.3,child: const ShimmerFeaturedList()),
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const CustomErrorImageWidget()
            ),
          )),
    );
  }
}

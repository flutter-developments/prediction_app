import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:girafee/utils/app_colors.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    Key? key,
    required this.photo,
    required this.radius,
  }) : super(key: key);

  final String? photo;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photo!,
      placeholder: (context, url) => CircularProgressIndicator(),
      imageBuilder: (context, imageProvider) {
        return Container(
            height: radius,
            width: radius,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyBackColor,
            ),
            child: ClipOval(
              child: Image.network(
                photo!,
                fit: BoxFit.cover,
              ),
            ));
      },
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachNetWorkImageItem extends StatelessWidget {
  final double heightImageNetWork;
  final double? widthtImageNetWork;
  final double heightImageError;
  final String imageUrl;
  const CachNetWorkImageItem({
    Key? key,
    required this.heightImageNetWork,
    this.widthtImageNetWork,
    required this.heightImageError,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: widthtImageNetWork,
      height: heightImageNetWork,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset(
        'assets/loading.png',
        fit: BoxFit.cover,
        height: heightImageError,
      ),
    );
  }
}

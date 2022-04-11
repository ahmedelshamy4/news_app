import 'package:flutter/material.dart';

import '../../models/artical_model.dart';
import '../pages/details_article.dart';
import 'cach_netWork_imageItem.dart';

class TopNewsItem extends StatelessWidget {
  final ArticleModel article;
  const TopNewsItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsArticlePage(article: article),
          ),
        );
      },
      child: Stack(
        children: [
          CachNetWorkImageItem(
            widthtImageNetWork: 250,
            heightImageNetWork: 150,
            heightImageError: 150,
            imageUrl: article.urlToImage,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.2),
              ),
              child: Text(
                article.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

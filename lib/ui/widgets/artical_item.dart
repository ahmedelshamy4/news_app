import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:news_app/provider/favorite_notifier.dart';
import 'package:news_app/ui/widgets/cach_netWork_imageItem.dart';
import 'package:share_plus/share_plus.dart';

import '../../models/artical_model.dart';
import '../pages/details_article_page.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel article;
  const ArticleItem({Key? key, required this.article}) : super(key: key);

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
      child: Card(
        elevation: 15,
        child: SizedBox(
          height: 140,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        child: Text(
                          article.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Consumer(
                            builder: (context, ref, child) {
                              final addFavorite =
                                  ref.watch(favoriteChangeNotifierProvider);
                              return IconButton(
                                onPressed: () {
                                  addFavorite.isFavorite(article.url)
                                      ? addFavorite.removeFromFav(article)
                                      : addFavorite.addToFav(article);
                                },
                                icon: Icon(
                                  addFavorite.isFavorite(article.url)
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          IconButton(
                            onPressed: () {
                              Share.share(article.url);
                            },
                            icon: const Icon(Icons.share),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(DateFormat.MEd().format(article.publishedAt)),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CachNetWorkImageItem(
                        heightImageNetWork: 130,
                        heightImageError: 100,
                        imageUrl: article.urlToImage,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

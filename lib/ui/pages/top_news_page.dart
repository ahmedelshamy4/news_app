import 'package:flutter/material.dart';
import 'package:news_app/services/news_services.dart';

import '../../models/artical_model.dart';
import '../widgets/top_news_item.dart';

class TopNewsPage extends StatelessWidget {
  const TopNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>?>(
      future: NewsServices.getNewestArticlesPopularity(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: const [
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }
        if (snapshot.hasData) {
          return Container(
            padding: const EdgeInsets.only(left: 15, top: 10),
            height: 150,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3 / 3,
                crossAxisCount: 1,
                mainAxisExtent: 250,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return TopNewsItem(article: snapshot.data![index]);
              },
            ),
          );
        } else {
          return Column(
            children: const [
              Center(
                child: Text('There are no data'),
              ),
            ],
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../models/artical_model.dart';
import '../../services/news_services.dart';
import '../widgets/artical_item.dart';

class PublishersSourcesPage extends StatelessWidget {
  const PublishersSourcesPage({Key? key, required this.sourceId})
      : super(key: key);

  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ArticleModel>?>(
        future: NewsServices.getOneSourceOfMagazines(sources: sourceId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              children: const [
                SizedBox(
                  height: 80,
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
          if (snapshot.hasData) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const PageScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ArticleItem(article: snapshot.data![index]);
              },
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
                thickness: 0.4,
              ),
            );
          } else {
            return Column(
              children: const [
                SizedBox(
                  height: 80,
                ),
                Center(
                  child: Text('There are no data'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

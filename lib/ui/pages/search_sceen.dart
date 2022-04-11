import 'package:flutter/material.dart';
import 'package:news_app/services/news_services.dart';

import '../../models/artical_model.dart';
import '../widgets/artical_item.dart';

class SearchPage extends StatefulWidget {
  static const id = '/searchPage';
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        flexibleSpace: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: TextField(
              onSubmitted: (value) {
                setState(() {
                  search = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search ',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<ArticleModel>?>(
              stream: NewsServices.getSearchArticles(search: search).asStream(),
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
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const PageScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ArticleItem(article: snapshot.data![index]);
                    },
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
            )
          ],
        ),
      ),
    );
  }
}

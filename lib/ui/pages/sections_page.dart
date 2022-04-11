import 'package:flutter/material.dart';
import 'package:news_app/services/news_services.dart';

import '../../models/artical_model.dart';
import '../widgets/artical_item.dart';

class SectionsPage extends StatefulWidget {
  const SectionsPage({Key? key}) : super(key: key);

  @override
  State<SectionsPage> createState() => _SectionsPageState();
}

class _SectionsPageState extends State<SectionsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Sections',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Color(0xff76A0A7),
              unselectedLabelStyle: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              tabs: [
                Tab(text: 'Business'),
                Tab(text: 'Entertainment '),
                Tab(text: 'General '),
                Tab(text: 'Health '),
                Tab(text: 'Science'),
                Tab(text: 'Sports '),
                Tab(text: 'Technology'),
              ]),
        ),
        body: const TabBarView(
          children: [
            AllCategoryPage(
              category: 'business',
            ),
            AllCategoryPage(
              category: 'entertainment',
            ),
            AllCategoryPage(
              category: 'general',
            ),
            AllCategoryPage(
              category: 'health',
            ),
            AllCategoryPage(
              category: 'science',
            ),
            AllCategoryPage(
              category: 'sports',
            ),
            AllCategoryPage(
              category: 'technology',
            ),
          ],
        ),
      ),
    );
  }
}

class AllCategoryPage extends StatelessWidget {
  final String category;
  const AllCategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        FutureBuilder<List<ArticleModel>?>(
            future: NewsServices.getOneCategoryOfNews(category: category),
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
            })
      ]),
    );
  }
}

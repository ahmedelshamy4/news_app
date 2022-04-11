import 'package:flutter/material.dart';
import 'package:news_app/ui/pages/SourcePage.dart';
import 'package:news_app/ui/pages/top_news_page.dart';

import '../widgets/HeadlineTitle.dart';
import 'news_country_page.dart';
import 'search_sceen.dart';

class HomePage extends StatefulWidget {
  static const id = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.5,
          title: const Text(
            'NewsNow',
            style: TextStyle(color: Colors.teal),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.id);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: ListView(
          children: const [
            HeadlineTitle(title: 'Publishers'),
            SourcePage(),
            HeadlineTitle(title: 'Top News'),
            TopNewsPage(),
            HeadlineTitle(title: 'News Country'),
            NewsCountryPage(),
          ],
        ),
      ),
    );
  }
}

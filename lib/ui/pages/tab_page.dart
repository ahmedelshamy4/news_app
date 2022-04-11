import 'package:flutter/material.dart';
import 'package:news_app/ui/pages/home_page.dart';

import 'favorite_page.dart';
import 'sections_page.dart';

class TabPages extends StatefulWidget {
  static const id = '/TapScreen';
  const TabPages({Key? key}) : super(key: key);

  @override
  State<TabPages> createState() => _TabPagesState();
}

class _TabPagesState extends State<TabPages> {
  final List<Map<String, Widget>> _pages = [
    {
      'page': const HomePage(),
    },
    {
      'page': const SectionsPage(),
    },
    {
      'page': const FavoritePage(),
    },
  ];
  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: BottomNavigationBar(
          elevation: 0.9,
          selectedItemColor: const Color(0xff3FC1C0),
          iconSize: 30,
          unselectedItemColor: const Color(0xffC4D9DC),
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _selectedPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.toc),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

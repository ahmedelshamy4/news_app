import 'package:news_app/models/artical_model.dart';
import 'package:news_app/models/source_model.dart';

import '../data/apis/api.dart';
import '../data/contents/contents.dart';

class NewsServices {
  //* search for in the article title and body.
  static Future<List<ArticleModel>?> getSearchArticles(
      {required String search}) async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/everything?q=$search&apiKey=$apiKey',
    );
    List<ArticleModel> newsData = [];
    if (jsonData['status'] == 'ok') {
      List<dynamic> newsList = jsonData['articles'];

      for (var data in newsList) {
        newsData.add(ArticleModel.fromJson(data));
      }

      return newsData;
    }
    return [];
  }

  //*  newest articles Popularity
  static Future<List<ArticleModel>?> getNewestArticlesPopularity() async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/top-headlines?country=us&sortBy=popularity&apiKey=$apiKey',
    );
    List<ArticleModel> newsData = [];
    if (jsonData['status'] == 'ok') {
      List<dynamic> newsList = jsonData['articles'];

      for (var data in newsList) {
        newsData.add(ArticleModel.fromJson(data));
      }

      return newsData;
    }
    return [];
  }

  //*  The category you want to get headlines for.
  static Future<List<ArticleModel>?> getOneCategoryOfNews(
      {required String category}) async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/top-headlines?category=$category&apiKey=$apiKey',
    );
    List<ArticleModel> newsData = [];
    if (jsonData['status'] == 'ok') {
      List<dynamic> newsList = jsonData['articles'];

      for (var data in newsList) {
        newsData.add(ArticleModel.fromJson(data));
      }

      return newsData;
    }
    return [];
  }

  //!  Get one article from each category
  static Future<ArticleModel?> getOneArticleFromEachCategory(
      {required String category}) async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/top-headlines?category=$category&apiKey=$apiKey',
    );

    Map<String, dynamic> data = jsonData['articles'][0];
    ArticleModel article = ArticleModel.fromJson(data);

    return article;
  }

  //!  the country you want to get headlines for.
  static Future<List<ArticleModel>?> getNewsOfSpecificCountry() async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/top-headlines?country=eg&apiKey=$apiKey',
    );
    List<ArticleModel> newsData = [];
    if (jsonData['status'] == 'ok') {
      List<dynamic> newsList = jsonData['articles'];

      for (var data in newsList) {
        newsData.add(ArticleModel.fromJson(data));
      }

      return newsData;
    }
    return [];
  }

  //*  News source one of the magazines
  static Future<List<ArticleModel>?> getOneSourceOfMagazines(
      {required String sources}) async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/top-headlines?sources=$sources&apiKey=$apiKey',
    );
    List<ArticleModel> newsData = [];
    if (jsonData['status'] == 'ok') {
      List<dynamic> newsList = jsonData['articles'];

      for (var data in newsList) {
        newsData.add(ArticleModel.fromJson(data));
      }

      return newsData;
    }
    return [];
  }

  //*  use to keep track of the publishers available on the API,
  static Future<List<SourceModel>?> getSources() async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/top-headlines/sources?apiKey=$apiKey',
    );
    List<SourceModel> sourcesData = [];
    if (jsonData['status'] == 'ok') {
      List<dynamic> sourcesList = jsonData['sources'];

      for (var data in sourcesList) {
        sourcesData.add(SourceModel.fromJson(data));
      }

      return sourcesData;
    }
    return [];
  }
}

import 'package:flutter/material.dart';
import 'package:news_app_cruze/api_manager/api_manager.dart';
import 'package:news_app_cruze/api_manager/model/news_model/NewsResponse.dart';
import 'package:news_app_cruze/api_manager/model/sources_model/Sources.dart';
import 'package:news_app_cruze/ui/news/news_item.dart';

class NewsWidegt extends StatelessWidget {
  Sources? sources;

  NewsWidegt({required this.sources});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(sources!.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        var newsList = snapshot.data!.articles ?? [];

        return ListView.builder(
          itemBuilder: (context, index) => NewsItem(
            articles: newsList,
            index: index,
          ),
          itemCount: newsList.length,
        );
      },
    );
  }
}

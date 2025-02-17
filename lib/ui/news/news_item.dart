import 'package:flutter/material.dart';
import 'package:news_app_cruze/api_manager/model/news_model/Articles.dart';

class NewsItem extends StatelessWidget {
  List<Articles> articles;
  int index;

  NewsItem({required this.articles, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                    image: NetworkImage(articles[index].urlToImage ?? ''),
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(articles[index].title ?? '')
        ],
      ),
    );
  }
}

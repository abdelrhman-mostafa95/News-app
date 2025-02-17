import 'package:flutter/material.dart';
import 'package:news_app_cruze/api_manager/model/news_model/Articles.dart';

class NewsHomeItem extends StatelessWidget {
  List<Articles> articles;
  int index;

  NewsHomeItem({required this.articles, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        alignment: Alignment.bottomLeft,
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Text(
                articles[index].title ?? '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}

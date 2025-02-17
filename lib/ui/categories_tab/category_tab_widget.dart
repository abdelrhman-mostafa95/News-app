import 'package:flutter/material.dart';
import 'package:news_app_cruze/api_manager/api_manager.dart';
import 'package:news_app_cruze/ui/categories_tab/category_data/category_item.dart';
import 'package:news_app_cruze/ui/categories_tab/category_widegts/category_widget.dart';

import '../../api_manager/model/sources_model/Sources.dart';
import '../news/news_home_item.dart';

typedef ClickedCategory = void Function(CategoryItem allCategories);

class CategoryTabWidget extends StatelessWidget {
  List<CategoryItem> allCategories = CategoryItem.getCategoryList();
  ClickedCategory clickedCategory;
  List<Sources> sourceList = [];

  CategoryTabWidget({required this.clickedCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            'Pick your category of interest',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    clickedCategory(allCategories[index]);
                  },
                  child: CategoryWidget(
                      catItem: allCategories[index], index: index)),
              itemCount: allCategories.length,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ApiManager.getHomeNews(),
              builder: (context, snapshot) {
                print('ssssssssssssssssssssssssssssssssssssssssssss');
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text('oops! something went wrong');
                }
                return ListView.builder(
                  itemBuilder: (context, index) => NewsHomeItem(
                    articles: snapshot.data!.articles!,
                    index: index,
                  ),
                  itemCount: 3,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

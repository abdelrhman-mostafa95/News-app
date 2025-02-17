import 'package:flutter/material.dart';
import 'package:news_app_cruze/ui/categories_tab/category_data/category_item.dart';
import 'package:news_app_cruze/ui/categories_tab/category_widegts/category_widget.dart';

typedef ClickedCategory = void Function(CategoryItem allCategories);

class CategoryTabWidget extends StatelessWidget {
  List<CategoryItem> allCategories = CategoryItem.getCategoryList();
  ClickedCategory clickedCategory;

  CategoryTabWidget({required this.clickedCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            'Pick your category \nof interest',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    clickedCategory(allCategories[index]);
                  },
                  child: CategoryWidget(
                      catItem: allCategories[index], index: index)),
              itemCount: allCategories.length,
            ),
          )
        ],
      ),
    );
  }
}

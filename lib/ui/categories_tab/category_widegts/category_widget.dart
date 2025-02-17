import 'package:flutter/material.dart';
import 'package:news_app_cruze/ui/categories_tab/category_data/category_item.dart';

class CategoryWidget extends StatelessWidget {
  CategoryItem catItem;
  int index;

  CategoryWidget({required this.catItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(width: 2, color: Colors.green),
      ),
      child: Text(
        catItem.title ?? '',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    );
  }
}

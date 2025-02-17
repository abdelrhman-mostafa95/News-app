import 'package:flutter/material.dart';
import 'package:news_app_cruze/ui/categories_tab/category_data/category_item.dart';

class CategoryWidget extends StatelessWidget {
  CategoryItem catItem;
  int index;

  CategoryWidget({required this.catItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: catItem.background,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(index.isEven ? 0 : 50),
            bottomLeft: Radius.circular(index.isEven ? 50 : 0),
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            catItem.imagePath,
            width: 130,
            height: 115,
          ),
          Text(
            catItem.title,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
          )
        ],
      ),
    );
  }
}

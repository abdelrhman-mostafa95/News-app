import 'package:flutter/material.dart';
import 'package:news_app_cruze/api_manager/model/sources_model/Sources.dart';
import 'package:news_app_cruze/ui/categories_tab/category_data/category_item.dart';
import 'package:news_app_cruze/ui/categories_tab/category_tab_widget.dart';
import 'package:news_app_cruze/ui/categories_tab/categoty_details/category_details.dart';
import 'package:news_app_cruze/ui/home/home_drawer.dart';
import 'package:news_app_cruze/ui/settings_tab/settings_tab_widget.dart';
import 'package:news_app_cruze/utils/image_path.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  List<CategoryItem> allCategories = CategoryItem.getCategoryList();
  Sources? sources;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(ImagePath.GetImagePath('pattern.png')))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('News App'),
        ),
        drawer: HomeDrawer(
          onMenuClickedTab: clickedTab,
        ),
        body: selectedWidget,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoryTabWidget(
      clickedCategory: clickedCategoryItem,
    );
  }

  late Widget selectedWidget;

  void clickedTab(MenuItem item) {
    switch (item) {
      case MenuItem.category:
        {
          selectedWidget = CategoryTabWidget(
            clickedCategory: clickedCategoryItem,
          );
        }
      case MenuItem.settings:
        {
          selectedWidget = SettingsTabWidget();
        }
    }
    Navigator.pop(context);
    setState(() {});
  }

  clickedCategoryItem(CategoryItem catItem) {
    selectedWidget = CategoryDetails(
      catItem: catItem,
    );
    setState(() {});
  }
}

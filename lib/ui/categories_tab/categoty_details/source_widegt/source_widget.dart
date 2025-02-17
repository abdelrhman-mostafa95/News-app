import 'package:flutter/material.dart';
import 'package:news_app_cruze/api_manager/model/sources_model/Sources.dart';

class SourceWidget extends StatelessWidget {
  Sources source;
  bool isSelected;

  SourceWidget({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 2, color: Colors.green),
          color: isSelected ? Colors.green : Colors.white),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}
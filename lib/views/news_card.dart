import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:simple_news_app/articles_model.dart';
import 'package:simple_news_app/views/news_details_page.dart';

Widget newsCard(ArticlesModel articlesModel, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Get.to(() => newsDetails(articlesModel, context));
    },
    child: Card(
      shadowColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.network(
                articlesModel.urlToImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              articlesModel.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
              left: 15,
              right: 15,
            ),
            child: Text(
              articlesModel.content,
              softWrap: true,
              maxLines: 2,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 15,
            ),
            child: Row(
              children: [
                Text(
                  articlesModel.source!.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:simple_news_app/api_service/api_service.dart';
import 'package:simple_news_app/articles_model.dart';
import 'package:get/get.dart';
import 'package:simple_news_app/views/news_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'SimpleNewsApp',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //backgroundColor: Colors.grey,
      body: SafeArea(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: client.getArticles(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<ArticlesModel>> snapshot) {
                  if (snapshot.hasData) {
                    List<ArticlesModel>? articles = snapshot.data;

                    return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: articles!.length,
                        itemBuilder: (context, index) =>
                            newsCard(articles[index], context));
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}

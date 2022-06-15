import 'package:flutter/material.dart';
import 'package:intro/model/article.dart';
import 'package:intro/views/article_detail_view.dart';

class ArticlePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ArticlePageState();
}

class ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("學習筆記"),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: Article.samples.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) {
                        return  ArticleDetailPage(article: Article.samples[index]);
                      },
                    ),
                  );
                },
                child: buildArticleCard(Article.samples[index]),
              );
            }),
      ),
    );
  }
}

Widget buildArticleCard(Article article) {
  return Card(
      elevation: 2.0, //陰影位置
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Image(image: AssetImage(article.imageUrl), width: 80),
            const SizedBox(
              width: 20.0,
            ),
            Text(article.label,
                style: const TextStyle(
                  fontSize: 20.0,
                )),
          ],
        ),
      ));
}

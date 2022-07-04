import 'package:flutter/material.dart';
import 'package:intro/model/article.dart';
import 'package:intro/views/article_detail_view.dart';
import 'package:intro/widgets/tools.dart';

import '../model/intro_pages.dart';

class ArticlePage extends StatefulWidget {
  static MaterialPage page() {
    debugPrint('ArticlePage');
    return MaterialPage(
      name: IntroPages.loginPath,
      key: ValueKey(IntroPages.loginPath),
      child: ArticlePage(),
    );
  }
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
      appBar: SwitchAppBar('學習筆記', null),
      body: SafeArea(
        child: ListView.builder(
            itemCount: Article.samples.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ArticleDetailPage(
                            article: Article.samples[index]);
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
            Flexible(
              child: Text(article.label,
                  style: const TextStyle(
                    fontSize: 20.0,
                  )),
            )
          ],
        ),
      ));
}

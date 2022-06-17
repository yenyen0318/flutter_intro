import 'package:flutter/material.dart';
import 'package:intro/widgets/custom_theme.dart';

class TypeSettingCard1 extends StatelessWidget {
  const TypeSettingCard1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Theme.of(context).colorScheme.typeSettingDemoBackgroundImage,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Text(
              '文章分類',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Positioned(
              child: Text(
                '標題',
                style: Theme.of(context).textTheme.headline4,
              ),
              top: 20,
            ),
            Positioned(
              child: Text(
                '各種更為詳細的描述',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              bottom: 30,
              right: 0,
            ),
            Positioned(
              child: Text(
                '作者名稱',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              bottom: 10,
              right: 0,
            )
          ],
        ),
      ),
    );
  }
}

class TypeSettingCard2 extends StatelessWidget {
  const TypeSettingCard2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Theme.of(context).colorScheme.typeSettingDemoBackgroundImage,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            const AuthorCard(
                authorName: '作者名稱',
                title: '小標題',
                imageProvider: AssetImage('assets/images/cat.jpg')),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      '右下橫文字',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        '置左直文字',
                        style: Theme.of(context).textTheme.headline4,
                      ),
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
}

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.imageProvider,
    this.imageRadius = 20,
  }) : super(key: key);

  final double imageRadius;
  final ImageProvider imageProvider;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }
}

class AuthorCard extends StatelessWidget {
  final String authorName;
  final String title;
  final ImageProvider imageProvider;
  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    required this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            CircleImage(imageProvider: imageProvider, imageRadius: 28),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  authorName,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
          ]),
          IconButton(
              icon: const Icon(Icons.favorite_border),
              iconSize: 30,
              color: Colors.grey[400],
              onPressed: () {
                const snackBar = SnackBar(content: Text('點擊愛心'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
        ],
      ),
    );
  }
}

class TypeSettingCard3 extends StatelessWidget {
  const TypeSettingCard3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Theme.of(context).colorScheme.typeSettingDemoBackgroundImage, fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.maskColor.withOpacity(0.4),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.book, color: Colors.grey, size: 40),
                  const SizedBox(height: 8),
                  Text('透明遮罩及標籤',
                      style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            Center(
              child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12,
                  children: ['Healthy', 'aaa', 'bbbbbbb', 'ccccccccccc', 'dddddddd', 'eeeeeeeeee', 'wwwwwwwwwwwwwwwwwwwww'].map((item) {
                    return Chip(
                      label: Text(item,
                          style: Theme.of(context).textTheme.bodyText1),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .maskColor
                          .withOpacity(0.7),
                    );
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intro/views/about_view.dart';
import 'package:intro/views/drag_play_view.dart';
import 'package:intro/views/video_view.dart';
import 'package:intro/views/login_view.dart';
import 'package:intro/views/todo_view.dart';
import 'package:intro/widgets/custom_gradient_item.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(gradientColors: [
        Color.fromARGB(255, 106, 131, 176),
        Color.fromRGBO(199, 136, 157, 1)
      ], text: 'Hello'),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            //設定用户名稱
            UserAccountsDrawerHeader(
                accountName: const GradientText(
                  text: 'CHEN YEN YEN',
                  gradientColors: [
                    Color.fromARGB(255, 106, 131, 176),
                    Color.fromRGBO(199, 136, 157, 1)
                  ],
                ),
                accountEmail: const Text(
                  "janis03050055@gmail.com",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                //設定大頭照
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/cat2.jpg"),
                ),
                decoration: BoxDecoration(
                    border: Border.all(width: 0, color: Colors.transparent),
                    color: Colors.transparent)),
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text('關於我'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                }),
            ListTile(
                leading: const Icon(Icons.science),
                title: const Text('實驗頁面'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }),
            ExpansionTile(
                title: const Text('作品集'),
                leading: const Icon(
                  Icons.favorite,
                ),
                backgroundColor: const Color.fromARGB(246, 234, 232, 232),
                textColor: Colors.black,
                iconColor: Colors.black45,
                collapsedBackgroundColor: Colors.transparent,
                collapsedTextColor: Colors.black,
                collapsedIconColor: Colors.black45,
                children: <Widget>[
                  ListTile(
                      leading: const Icon(
                        Icons.science,
                        color: Colors.transparent,
                      ),
                      title: const Text('待辦事項'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TodoListPage(
                                    title: '待辦事項',
                                  )),
                        );
                      }),
                  ListTile(
                      leading: const Icon(
                        Icons.science,
                        color: Colors.transparent,
                      ),
                      title: const Text('影片播放'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VideoPage(
                                    title: '影片播放',
                                  )),
                        );
                      }),
                  ListTile(
                      leading: const Icon(
                        Icons.science,
                        color: Colors.transparent,
                      ),
                      title: const Text('文字辨識'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }),
                  ListTile(
                      leading: const Icon(
                        Icons.science,
                        color: Colors.transparent,
                      ),
                      title: const Text('取得當前座標'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }),
                ])
          ],
        ),
      ),
      body: DragPlayPage()
    );
  }
}

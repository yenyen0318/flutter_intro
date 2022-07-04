import 'package:flutter/material.dart';
import 'package:intro/model/intro_pages.dart';
import 'package:intro/navigation/app_state_manager.dart';
import 'package:intro/views/about_view.dart';
import 'package:intro/views/article_view.dart';
import 'package:intro/views/drag_play_view.dart';
import 'package:intro/views/type_setting_view.dart';
import 'package:intro/views/video_view.dart';
import 'package:intro/views/login_view.dart';
import 'package:intro/views/todo_view.dart';
import 'package:intro/widgets/custom_gradient_item.dart';
import 'package:intro/widgets/tools.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  static MaterialPage page() {
    debugPrint('MyHomePage');
    return MaterialPage(
      name: IntroPages.home,
      key: ValueKey(IntroPages.home),
      child: const MyHomePage(),
    );
  }

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SwitchAppBar('Hello', null),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              //設定用户名稱
              UserAccountsDrawerHeader(
                  accountName: const GradientText(
                    text: 'CHEN YEN YEN',
                  ),
                  accountEmail: Text(
                    "janis03050055@gmail.com",
                    style: Theme.of(context).textTheme.bodyText2,
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
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()),
                    );
                  }),
              ListTile(
                  leading: const Icon(Icons.article),
                  title: const Text('學習筆記'),
                  onTap: () {
                    Provider.of<AppStateManager>(context, listen: false)
                        .TapOnArticle(true);
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
                  title: Text(
                    '作品集',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  leading: Icon(
                    Icons.favorite,
                    color: Theme.of(context).listTileTheme.iconColor,
                  ),
                  backgroundColor:
                      Theme.of(context).listTileTheme.selectedColor,
                  textColor: Theme.of(context).listTileTheme.textColor,
                  iconColor: Theme.of(context).listTileTheme.iconColor,
                  collapsedBackgroundColor: Colors.transparent,
                  collapsedTextColor: Theme.of(context).listTileTheme.textColor,
                  collapsedIconColor: Theme.of(context).listTileTheme.iconColor,
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
                        title: const Text('文章模板'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TypeSettingPage(
                                      title: '文章模板',
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
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
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
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        }),
                  ]),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('設定'),
                  onTap: () {
                    Provider.of<AppStateManager>(context, listen: false)
                        .TapOnSettings(true);
                  }),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('登出'),
                  onTap: () {
                    Provider.of<AppStateManager>(context, listen: false)
                        .logout();
                  }),
            ],
          ),
        ),
        body: DragPlayPage());
  }
}

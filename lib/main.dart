import 'package:flutter/material.dart';
import 'package:intro/views/about_view.dart';
import 'package:intro/views/login_view.dart';
import 'package:intro/widgets/custom_gradient_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: const GradientAppBar(
        gradientColors: [Color.fromARGB(255, 106, 131, 176),Color.fromRGBO(199, 136, 157, 1)],
        text: 'Hello'
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            //設定用户名稱
            UserAccountsDrawerHeader(
              accountName:const  GradientText(
                text: 'CHEN YEN YEN', 
                gradientColors: 
                [Color.fromARGB(255, 106, 131, 176),Color.fromRGBO(199, 136, 157, 1)],
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
              decoration:BoxDecoration(
                  border: Border.all(width: 0, color: Colors.transparent),
                  color: Colors.transparent
                  )
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('關於我'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              }
            ),
            ListTile(
              leading: const Icon(Icons.science),
              title: const Text('實驗頁面'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
            ),
          ],
        ),
      ),
    ); 
  }
}


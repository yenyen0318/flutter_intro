import 'package:flutter/material.dart';
import 'package:intro/widgets/custom_gradient_item.dart';
import 'package:intro/widgets/timeline.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: const GradientAppBar(
        gradientColors: [Color.fromARGB(255, 106, 131, 176),Color.fromRGBO(199, 136, 157, 1)],
        text: '關於我'
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('個人資訊',style: TextStyle(fontSize: 24) ,),
            ),
            Timeline(
              indicatorSize: 0,
              children: <Widget>[
                Container(
                  height: 130, 
                  color: Colors.black12,
                  child: const ListTile(
                    title: Text("XXXXXXXXXXXX"),
                    subtitle:Text("XXXXXXXXXXXXXXXXXXXXXX"),
                  ),
                ),
              ]
            ),
            const ListTile(
              leading: Icon(Icons.star),
              title: Text('技能樹',style: TextStyle(fontSize: 24) ,),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
              child: GradientChips(
                items:['Python','Javascript','C#','.net','Dart','vue.js','flutter','MSSQL','SQLite', 'RMQ'],
                gradientColors: [Color.fromARGB(255, 106, 131, 176),Color.fromRGBO(199, 136, 157, 1)],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.business),
              title: Text('學經歷' ,style: TextStyle(fontSize: 24) ,),
            ),
            Timeline(
              indicatorSize: 60,
              children: <Widget>[
                Container(
                  height: 130, 
                  color: Colors.transparent,
                  child: const ListTile(
                    title: Text("國立XXXX大學 資訊工程系"),
                    subtitle:Text("輔修XXX系\n多益 XXX \n系排名 X \n社團 XXXX"),
                  ),
                ),
                 Container(
                  height: 70, 
                  color: Colors.transparent,
                  child: const ListTile(
                    title: Text("XXXXX公司-助理工程師(實習)"),
                    subtitle:Text("網頁撰寫MVC(.Net+MSSQL)"),
                  ),
                ),
                Container(
                  height: 130, 
                  color: Colors.transparent,
                  child: const ListTile(
                    title: Text("XXXXX公司-專案助理工程師"),
                    subtitle:Text("影像辨識(PyTorch + yolo v3)\n網頁撰寫(.Net+MSSQL+EF6 )\nPython 為輔撰寫相關輔助程式(label、轉檔、資料視覺等)"),
                  ),
                ),
                Container(
                  height: 110, 
                  color: Colors.transparent,
                  child: const ListTile(
                    title: Text("XXXXX公司-工程師"),
                    subtitle:Text("網頁撰寫(.Net+MSSQL+EF6 )\n協助資料庫備份\n處理客服回饋相關問題"),
                  ),
                ),
                Container(
                  height: 110, 
                  color: Colors.transparent,
                  child: const ListTile(
                    title: Text("XXXXX公司-工程師"),
                    subtitle:Text("網頁前端直播串流源處理(js + C#)\n前端聊天室訊息處理(js)\n將資料進行視覺處理(js)"),
                  ),
                ),
              ],
              indicators: const <Widget>[
                Chip(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  label: Text('2015', style: TextStyle(color: Colors.grey)),
                ),
                Chip(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  label: Text('2017', style: TextStyle(color: Colors.grey)),
                ),
                Chip(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  label: Text('2018', style: TextStyle(color: Colors.grey)),
                ),
                Chip(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  label: Text('2019', style: TextStyle(color: Colors.grey)),
                ),
                Chip(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  label: Text('2022', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ]
        )
      )
    );
  }
}
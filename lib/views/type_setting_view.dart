import 'package:flutter/material.dart';
import 'package:intro/widgets/type_setting_card.dart';
import 'package:intro/widgets/tools.dart';

class TypeSettingPage extends StatefulWidget {
  const TypeSettingPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _TypeSettingPageState createState() => _TypeSettingPageState();
}

class _TypeSettingPageState extends State<TypeSettingPage> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const TypeSettingCard1(),
    const TypeSettingCard2(),
    const TypeSettingCard3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SwitchAppBar(widget.title, null),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard), label: '模板1'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard), label: '模板2'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard), label: '模板3'),
            ]));
  }
}

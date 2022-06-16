import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isLight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('設定')),
        body: ListView(children: [
          SwitchListTile(
            title: const Text('主題'),
            value: _isLight,
            onChanged: (bool value) {
              setState(() {
                _isLight = value;
              });
            },
            secondary: _isLight ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
          ),
        ]));
  }
}

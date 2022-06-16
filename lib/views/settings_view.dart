import 'package:flutter/material.dart';
import 'package:intro/main.dart';
import 'package:intro/widgets/tools.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SwitchAppBar('設定', null),
        body: ListView(children: [
          SwitchListTile(
            title: const Text('深色模式'),
            value: _isDark,
            onChanged: (bool value) {
              setState(() {
                _isDark = value;
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              });
            },
            secondary: Icon(Icons.dark_mode),
          ),
        ]));
  }
}

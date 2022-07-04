import 'package:flutter/material.dart';
import 'package:intro/main.dart';
import 'package:intro/widgets/tools.dart';
import 'package:provider/provider.dart';

import '../model/intro_pages.dart';
import '../navigation/app_state_manager.dart';

class SettingsPage extends StatefulWidget {
  static MaterialPage page(bool isSecret) {
    debugPrint('SettingsPage');
    return MaterialPage(
      name: IntroPages.setting,
      key: ValueKey(IntroPages.setting),
      child: SettingsPage(needPwd: isSecret,),
    );
  }
  final bool needPwd;
  const SettingsPage({Key? key, required this.needPwd}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDark = false;
  late bool _isSecret;

  @override
  void initState() {
    super.initState();
    _isSecret = widget.needPwd;
  }

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
          SwitchListTile(
            title: const Text('保密模式'),
            subtitle: const Text('每次登入需輸入密碼'),
            value: _isSecret,
            onChanged: (bool value) {
             
              setState(() {
                _isSecret = value;
                String pwd = _isSecret ? '0519' : '';
                Provider.of<AppStateManager>(context, listen: false)
                      .setPwd(pwd);
              });
            },
            secondary: Icon(Icons.security),
          ),
        ]));
  }
}

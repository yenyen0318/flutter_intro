import 'dart:async';

import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _isSecret = true;
  bool _didSetting = false;
  bool _didArticle = false;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isSecret => _isSecret;
  bool get didSetting => _didSetting;
  bool get didArticle => _didArticle;

  //初始化APP
  void initializeApp() {
    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;
      _didSetting = false;
      notifyListeners();
    });
  }

  //登入
  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  //登出
  void logout() {
    _loggedIn = false;
    _initialized = false;

    initializeApp();
    notifyListeners();
  }

  //設置密碼
  void setPwd(String pwd) {
    _isSecret = pwd.isNotEmpty;

    debugPrint(pwd);
  }

  //進入設定頁
  void TapOnSettings(bool selected){
    _didSetting = selected;
    notifyListeners();
  }

  //進入設定頁
  void TapOnArticle(bool selected){
    _didArticle = selected;
    notifyListeners();
  }
}

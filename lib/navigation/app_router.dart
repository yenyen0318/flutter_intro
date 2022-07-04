import 'package:flutter/material.dart';
import 'package:intro/model/intro_pages.dart';
import 'package:intro/views/article_view.dart';
import 'package:intro/views/home_view.dart';
import 'package:intro/views/login_view.dart';
import 'package:intro/views/settings_view.dart';
import 'package:intro/views/splash_screen.dart';
import 'app_state_manager.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppStateManager appStateManager;

  AppRouter({required this.appStateManager})
      : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: List.of(_pages()),
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == IntroPages.setting) {
      appStateManager.TapOnSettings(false);
    }

    if (route.settings.name == IntroPages.article) {
      appStateManager.TapOnArticle(false);
    }

    return true;
  }

  List<Page<dynamic>> _pages(){
    return [
        if (!appStateManager.isInitialized) ...[
          SplashPage.page(),
        ] else if (appStateManager.isInitialized &&
            !appStateManager.isLoggedIn &&
            appStateManager.isSecret) ...[
          LoginPage.page(),
        ] else ...[
          MyHomePage.page(),
          if (appStateManager.didSetting) ...[
            SettingsPage.page(appStateManager.isSecret),
          ] else if (appStateManager.didArticle) ...[
            ArticlePage.page(),
          ] else
            ...[]
        ]
      ];
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}

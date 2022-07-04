import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro/navigation/app_router.dart';
import 'package:intro/widgets/custom_theme.dart';
import 'package:provider/provider.dart';

import 'navigation/app_state_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => _appStateManager,
          ),
        ],
        child: ValueListenableBuilder<ThemeMode>(
            valueListenable: MyApp.themeNotifier,
            builder: (_, ThemeMode currentMode, __) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: SpecialTheme.light(),
                darkTheme: SpecialTheme.dark(),
                themeMode: currentMode,
                home: Router(
                  routerDelegate: _appRouter,
                  backButtonDispatcher: RootBackButtonDispatcher(),
                ),
              );
            }));
  }
}

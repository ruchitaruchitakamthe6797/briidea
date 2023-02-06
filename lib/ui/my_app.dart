import 'package:app_briidea/constants/app_theme.dart';
import 'package:app_briidea/constants/strings.dart';
import 'package:app_briidea/data/repository.dart';
import 'package:app_briidea/di/components/service_locator.dart';
import 'package:app_briidea/provider/chat_provider.dart';
import 'package:app_briidea/stores/groupchat/groupchat_store.dart';
import 'package:app_briidea/stores/grouplist/grouplist_store.dart';
import 'package:app_briidea/stores/language/language_store.dart';
import 'package:app_briidea/stores/theme/theme_store.dart';
import 'package:app_briidea/stores/userchat/userchat_store.dart';
import 'package:app_briidea/stores/userlist/userlist_store.dart';
import 'package:app_briidea/ui/chat_page/chat.dart';
import 'package:app_briidea/ui/mobile/mobile_chat_ui.dart';
import 'package:app_briidea/ui/screens/home_sceen.dart';
import 'package:app_briidea/utils/locale/app_localization.dart';
import 'package:app_briidea/utils/routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());
  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());
  final GroupListStore _groupListStore = GroupListStore(getIt<Repository>());
  final UserListStore _userListStore = UserListStore(getIt<Repository>());
  final UserChatListStore _userChatListStore =
      UserChatListStore(getIt<Repository>());
  final GroupChatListStore _groupChatListStore =
      GroupChatListStore(getIt<Repository>());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => _themeStore),
        Provider<LanguageStore>(create: (_) => _languageStore),
        Provider<GroupListStore>(create: (_) => _groupListStore),
        Provider<UserListStore>(create: (_) => _userListStore),
        Provider<UserChatListStore>(create: (_) => _userChatListStore),
        Provider<GroupChatListStore>(create: (_) => _groupChatListStore),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return ChangeNotifierProvider(
            create: (context) => ChatProvider(),
            child: MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              title: Strings.appName,
              scrollBehavior: MyCustomScrollBehavior(),
              theme: _themeStore.darkMode ? themeDataDark : themeData,
              routes: Routes.routes,
              locale: Locale(_languageStore.locale),
              supportedLocales: _languageStore.supportedLanguages
                  .map((language) => Locale(language.locale!, language.code))
                  .toList(),
              localizationsDelegates: const [
                // A class which loads the translations from JSON files
                AppLocalizations.delegate,
                // Built-in localization of basic text for Material widgets
                GlobalMaterialLocalizations.delegate,
                // Built-in localization for text direction LTR/RTL
                GlobalWidgetsLocalizations.delegate,
                // Built-in localization of basic text for Cupertino widgets
                GlobalCupertinoLocalizations.delegate,
              ],
              home: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

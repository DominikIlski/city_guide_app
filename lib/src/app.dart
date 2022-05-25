import 'package:city_guide_app/providers/provider.dart';
import 'package:city_guide_app/screens/enter_screen.dart';
import 'package:city_guide_app/screens/home_screen.dart';
import 'package:city_guide_app/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import '../screens/error_screen.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;
  final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
    return await Firebase.initializeApp();
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialize = ref.watch(firebaseinitializerProvider);
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case HomeScreen.routeName:
                    return ref.watch(authStateProv).when(
                        data: (data) {
                          if (data != null) return const HomeScreen();
                          return const LoadingScreen();
                        },
                        loading: () => const LoadingScreen(),
                        error: (e, trace) => ErrorScreen(e, trace));
                  default:
                    return initialize.when(
                        data: (data) {
                          return const EnterScreen();
                        },
                        loading: () => const LoadingScreen(),
                        error: (e, trace) => ErrorScreen(e, trace));
                }
              },
            );
          },
        );
      },
    );
  }
}

import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_providers.dart';
import 'core/routing/app_router.dart';
import 'core/services/navigation_service.dart';
import 'core/services/firebase_service.dart';
import 'presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase'i başlat
  try {
    await FirebaseService.instance.initialize();
  } catch (e) {
    developer.log('Firebase başlatma hatası: $e', level: 1000);
    // Firebase başlatılamazsa da uygulama çalışmaya devam etsin
  }

  runApp(const ProviderScope(child: MyApp()));
}

/// Ana uygulama widget'ı
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AjansHosIslerApp();
  }
}

class AjansHosIslerApp extends ConsumerWidget {
  const AjansHosIslerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Ajans Hoş İşler',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      home: const HomePage(),
      onGenerateRoute: AppRouter.generateRoute,

      // Tema
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,

      // Localization
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('tr', 'TR'), Locale('en', 'US')],
      locale: const Locale('tr', 'TR'),

      // Builder
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(
              1.0,
            ), // Font scaling'i devre dışı bırak
          ),
          child: child!,
        );
      },
    );
  }
}



/// ğŸ§­ Navigation Service
///
/// Bu servis, uygulama genelinde navigation iÅŸlemlerini yÃ¶netir.
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../presentation/widgets/simple_loading_indicator.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get currentState => navigatorKey.currentState;

  static BuildContext? get currentContext => currentState?.context;

  /// Ana sayfaya git
  static void goToHome() {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('Ana Sayfaya GeÃ§iliyor...', () {
        currentState!.pushNamedAndRemoveUntil('/', (route) => false);
      });
    }
  }

  /// HakkÄ±mÄ±zda sayfasÄ±na git
  static void goToAbout({String? anchor}) {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('HakkÄ±mÄ±zda SayfasÄ± YÃ¼kleniyor...', () {
        currentState!.pushNamed('/about', arguments: anchor);
      });
    }
  }

  /// Ä°letiÅŸim sayfasÄ±na git
  static void goToContact() {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('Ä°letiÅŸim SayfasÄ± YÃ¼kleniyor...', () {
        currentState!.pushNamed('/contact');
      });
    }
  }

  /// Projeler sayfasÄ±na git
  static void goToWorks() {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('Projeler SayfasÄ± YÃ¼kleniyor...', () {
        currentState!.pushNamed('/works');
      });
    }
  }

  /// YÃ¼kleme gÃ¶ster ve navigasyon yap
  static void _showLoadingAndNavigate(String message, VoidCallback navigation) {
    if (currentContext != null) {
      // YÃ¼kleme overlay'ini gÃ¶ster
      showDialog(
        context: currentContext!,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        builder: (context) => PageTransitionLoading(message: message),
      );

      // KÄ±sa bir gecikme sonrasÄ± navigasyon yap
      Future.delayed(const Duration(milliseconds: 300), () {
        // YÃ¼kleme ekranÄ±nÄ± kapat
        Navigator.of(currentContext!).pop();
        // Navigasyonu yap
        navigation();
      });
    }
  }

  /// Proje detayÄ±na git
  static void goToProject(String projectId) {
    if (currentState != null) {
      currentState!.pushNamed('/project/$projectId');
    }
  }

  /// VEFA projesi sayfasÄ±na git
  static void goToVefa() {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('VEFA Projesi YÃ¼kleniyor...', () {
        currentState!.pushNamed('/vefa');
      });
    }
  }

  /// SEFA projesi sayfasÄ±na git
  static void goToSefa() {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('SEFA Projesi YÃ¼kleniyor...', () {
        currentState!.pushNamed('/sefa');
      });
    }
  }

  /// Konferans detayÄ±na git
  static void goToConference(String conferenceId) {
    if (currentState != null) {
      currentState!.pushNamed('/conference/$conferenceId');
    }
  }

  /// Konferanslar sayfasÄ±na git
  static void goToConferences() {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('Konferanslar SayfasÄ± YÃ¼kleniyor...', () {
        currentState!.pushNamed('/conferences');
      });
    }
  }

  /// TÃ¼m konferanslar sayfasÄ±na git
  static void goToAllConferences() {
    if (currentState != null) {
      currentState!.pushNamed('/conferences');
    }
  }

  /// Geri git
  static void goBack() {
    if (currentState != null && currentState!.canPop()) {
      currentState!.pop();
    }
  }

  /// Modal gÃ¶ster
  static Future<T?> showModal<T>(Widget modal) {
    if (currentContext != null) {
      return showModalBottomSheet<T>(
        context: currentContext!,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) => modal,
      );
    }
    return Future.value(null);
  }

  /// Dialog gÃ¶ster
  static Future<T?> showCustomDialog<T>(Widget dialog) {
    if (currentContext != null) {
      return showDialog<T>(
        context: currentContext!,
        builder: (context) => dialog,
      );
    }
    return Future.value(null);
  }

  /// Snackbar gÃ¶ster
  static void showSnackBar(
    String message, {
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    if (currentContext != null) {
      ScaffoldMessenger.of(currentContext!).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          duration: duration,
        ),
      );
    }
  }
}


/// Navigasyon Servisi
///
/// Bu servis, uygulama genelinde navigation işlemlerini yönetir.
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
      _showLoadingAndNavigate('Ana Sayfaya geçiliyor...', () {
        currentState!.pushNamedAndRemoveUntil('/', (route) => false);
      });
    }
  }

  /// Hakkımızda sayfasına git
  static void goToAbout({String? anchor}) {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('Hakkımızda sayfası yükleniyor...', () {
        currentState!.pushNamed('/about', arguments: anchor);
      });
    }
  }

  /// İletişim sayfasına git
  static void goToContact() {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('İletişim sayfası yükleniyor...', () {
        currentState!.pushNamed('/contact');
      });
    }
  }

  /// Projeler sayfasına git
  static void goToWorks() {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('Projeler sayfası yükleniyor...', () {
        currentState!.pushNamed('/works');
      });
    }
  }

  /// Yükleme göster ve navigasyon yap
  static void _showLoadingAndNavigate(String message, VoidCallback navigation) {
    if (currentContext != null) {
      // Yükleme overlay'ini göster
      showDialog(
        context: currentContext!,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        builder: (context) => PageTransitionLoading(message: message),
      );

      // Kısa bir gecikme sonrası navigasyon yap
      Future.delayed(const Duration(milliseconds: 300), () {
        // Yükleme ekranını kapat
        Navigator.of(currentContext!).pop();
        // Navigasyonu yap
        navigation();
      });
    }
  }

  /// Proje detayına git
  static void goToProject(String projectId) {
    if (currentState != null) {
      currentState!.pushNamed('/project/$projectId');
    }
  }

  /// VEFA projesi sayfasına git
  static void goToVefa() {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('VEFA projesi yükleniyor...', () {
        currentState!.pushNamed('/vefa');
      });
    }
  }

  /// SEFA projesi sayfasına git
  static void goToSefa() {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('SEFA projesi yükleniyor...', () {
        currentState!.pushNamed('/sefa');
      });
    }
  }

  /// Konferans detayına git
  static void goToConference(String conferenceId) {
    if (currentState != null) {
      currentState!.pushNamed('/conference/$conferenceId');
    }
  }

  /// Konferanslar sayfasına git
  static void goToConferences() {
    if (currentState != null) {
      HapticFeedback.lightImpact();
      _showLoadingAndNavigate('Konferanslar sayfası yükleniyor...', () {
        currentState!.pushNamed('/conferences');
      });
    }
  }

  /// Tüm konferanslar sayfasına git
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

  /// Modal göster
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

  /// Dialog göster
  static Future<T?> showCustomDialog<T>(Widget dialog) {
    if (currentContext != null) {
      return showDialog<T>(
        context: currentContext!,
        builder: (context) => dialog,
      );
    }
    return Future.value(null);
  }

  /// Snackbar göster
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

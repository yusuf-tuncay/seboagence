/// ğŸš€ App Router - Uygulama router'Ä±
///
/// Bu sÄ±nÄ±f, uygulamanÄ±n routing yapÄ±sÄ±nÄ± yÃ¶netir.
library;

import 'package:flutter/material.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/about_page.dart';
import '../../presentation/pages/works_page.dart';
import '../../presentation/pages/conferences_page.dart';
import '../../presentation/pages/contact_page.dart';
import '../../presentation/pages/project_detail_page.dart';
import '../../presentation/pages/vefa_detail_page.dart';
import '../../presentation/pages/sefa_detail_page.dart';

class AppRouter {
  static const String home = '/';
  static const String about = '/about';
  static const String works = '/works';
  static const String conferences = '/conferences';
  static const String contact = '/contact';
  static const String projectDetail = '/project';
  static const String vefa = '/vefa';
  static const String sefa = '/sefa';

  /// Sayfa yÃ¶nlendirme fonksiyonu
  static Widget getPage(String routeName, {String? projectId, String? aboutAnchor}) {
    switch (routeName) {
      case home:
        return const HomePage();
      case about:
        return AboutPage(scrollToSection: aboutAnchor);
      case works:
        return const WorksPage();
      case conferences:
        return const ConferencesPage();
      case contact:
        return const ContactPage();
      case projectDetail:
        return ProjectDetailPage(projectId: projectId ?? '1');
      case vefa:
        return const VefaDetailPage();
      case sefa:
        return const SefaDetailPage();
      default:
        return const HomePage();
    }
  }

  /// Sayfa geÃ§iÅŸ animasyonu
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? home;
    final Object? args = settings.arguments;
    String? projectId;
    String? aboutAnchor;
    if (routeName == projectDetail && args is String) {
      projectId = args;
    } else if (routeName == about && args is String) {
      aboutAnchor = args;
    }

    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) {
        return getPage(routeName, projectId: projectId, aboutAnchor: aboutAnchor);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Smooth fade transition
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(
        milliseconds: 200,
      ), // Smooth transition
    );
  }
}


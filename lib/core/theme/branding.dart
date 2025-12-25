import 'package:flutter/material.dart';

/// Ajans Hoş İşler marka kimliği ve renk paleti
class Branding {
  // Renk Paleti - Kurumsal Renkler
  static const Color primaryColor = Color(0xFF1A237E); // Deep navy blue
  static const Color secondaryColor = Color(0xFF3949AB); // Medium blue
  static const Color accentColor = Color(0xFFD4AF37); // Gold
  static const Color primaryBlue = Color(0xFF1A237E); // Primary blue
  static const Color gold = Color(0xFFD4AF37); // Gold
  static const Color textPrimary = Color(0xFF1A1A1A); // Dark text
  static const Color textSecondary = Color(0xFF424242); // Medium grey
  static const Color textLight = Color(0xFF757575); // Light grey
  static const Color backgroundPrimary = Color(0xFFFFFFFF); // White
  static const Color backgroundSecondary = Color(0xFFFAFAFA); // Light grey
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color darkGrey = Color(0xFF212121);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color error = Color(0xFFD32F2F); // Red
  static const Color success = Color(0xFF388E3C); // Green
  static const Color warning = Color(0xFFF57C00); // Orange

  // Theme renkleri
  static const Color primary = primaryColor;
  static const Color secondary = secondaryColor;
  static const Color surfaceLight = lightGrey;
  static const Color surfaceDark = darkGrey;
  static const Color backgroundLight = backgroundPrimary;
  static const Color backgroundDark = darkGrey;
  static const Color textOnPrimary = white;
  static const Color textOnSecondary = white;
  static const Color textOnAccent = black;
  static const Color textOnError = white;
  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color shadowLight = Color(0x1A000000);

  // Gradient Renkler
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColor, secondaryColor],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentColor, Color(0xFFB8860B)],
  );

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0B132B), // Very dark blue
      Color(0xFF1A237E), // Dark blue
      Color(0xFF3949AB), // Medium blue
    ],
    stops: [0.0, 0.5, 1.0],
  );

  // Yazı Tipleri
  static const String primaryFontFamily = 'Montserrat';
  static const String secondaryFontFamily = 'Poppins';

  // Logo Widget
  static Widget buildLogo({double fontSize = 28, Color? color}) {
    return Text(
      'ŞEBO',
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.bold,
        color: color ?? primaryColor,
        letterSpacing: 2.0,
      ),
    );
  }

  // Alt Logo Widget
  static Widget buildSubLogo({double fontSize = 12, Color? color}) {
    return Text(
      'creative agency',
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: secondaryFontFamily,
        fontWeight: FontWeight.w300,
        color: color ?? darkGrey,
        letterSpacing: 1.5,
      ),
    );
  }

  // Spacing Değerleri
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Border Radius Değerleri
  static const double radiusS = 4.0;
  static const double radiusM = 8.0;
  static const double radiusL = 12.0;
  static const double radiusXL = 16.0;

  // Navigation Height
  static const double navigationHeight = 90.0;

  // Border Width
  static const double borderWidth = 1.0;

  // Logo Line
  static const double lineHeight = 2.0;
  static const double logoLineWidth = 60.0;

  // Border radius
  static const double borderRadiusS = 4.0;
  static const double borderRadiusM = 8.0;
  static const double borderRadiusL = 12.0;
  static const double borderRadiusXL = 16.0;

  // Shadow Değerleri
  static const double shadowBlur = 4.0;

  static const List<BoxShadow> lightShadow = [
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 2), blurRadius: 4),
  ];

  static const List<BoxShadow> mediumShadow = [
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 4), blurRadius: 8),
  ];

  static const List<BoxShadow> heavyShadow = [
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 8), blurRadius: 16),
  ];
}


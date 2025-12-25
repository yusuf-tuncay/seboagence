import 'package:flutter/material.dart';
import 'branding.dart';

/// Ajans Hoş İşler tipografi sistemi
class AppTypography {
  // Başlık Stilleri
  static const TextStyle displayLarge = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.primaryColor,
    height: 1.2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.primaryColor,
    height: 1.2,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.primaryColor,
    height: 1.3,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.primaryColor,
    height: 1.3,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.primaryColor,
    height: 1.4,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.primaryColor,
    height: 1.4,
  );

  static const TextStyle h1 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.primaryColor,
    height: 1.2,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.primaryColor,
    height: 1.3,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.primaryColor,
    height: 1.4,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.darkGrey,
    height: 1.4,
  );

  static const TextStyle h5 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.darkGrey,
    height: 1.5,
  );

  static const TextStyle h6 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.darkGrey,
    height: 1.5,
  );

  // Gövde Metin Stilleri
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontFamily: Branding.secondaryFontFamily,
    color: Branding.darkGrey,
    height: 1.6,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: Branding.secondaryFontFamily,
    color: Branding.darkGrey,
    height: 1.6,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: Branding.secondaryFontFamily,
    color: Branding.darkGrey,
    height: 1.6,
  );

  // Özel Stiller
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: Branding.secondaryFontFamily,
    color: Branding.darkGrey,
    height: 1.4,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: Branding.secondaryFontFamily,
    color: Branding.darkGrey,
    letterSpacing: 1.5,
    height: 1.4,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.white,
    letterSpacing: 0.5,
  );

  static const TextStyle link = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: Branding.secondaryFontFamily,
    color: Branding.primaryColor,
    decoration: TextDecoration.none,
    height: 1.6,
  );

  // Platin Renkli Stiller
  static const TextStyle goldText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: Branding.secondaryFontFamily,
    color: Branding.accentColor,
    height: 1.6,
  );

  // Tema için eksik property'ler
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.primaryColor,
    height: 1.3,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.primaryColor,
    height: 1.4,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: Branding.primaryFontFamily,
    color: Branding.primaryColor,
    height: 1.4,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: Branding.secondaryFontFamily,
    color: Branding.darkGrey,
    height: 1.4,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: Branding.secondaryFontFamily,
    color: Branding.darkGrey,
    height: 1.4,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: Branding.secondaryFontFamily,
    color: Branding.darkGrey,
    height: 1.4,
  );

  // Responsive Tipografi
  static TextStyle getResponsiveHeading(BuildContext context, int level) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 768) {
      // Mobile
      switch (level) {
        case 1:
          return h1.copyWith(fontSize: 32);
        case 2:
          return h2.copyWith(fontSize: 28);
        case 3:
          return h3.copyWith(fontSize: 24);
        case 4:
          return h4.copyWith(fontSize: 20);
        case 5:
          return h5.copyWith(fontSize: 18);
        case 6:
          return h6.copyWith(fontSize: 16);
        default:
          return h1.copyWith(fontSize: 32);
      }
    } else if (screenWidth < 1024) {
      // Tablet
      switch (level) {
        case 1:
          return h1.copyWith(fontSize: 40);
        case 2:
          return h2.copyWith(fontSize: 32);
        case 3:
          return h3.copyWith(fontSize: 26);
        case 4:
          return h4.copyWith(fontSize: 22);
        case 5:
          return h5.copyWith(fontSize: 19);
        case 6:
          return h6.copyWith(fontSize: 17);
        default:
          return h1.copyWith(fontSize: 40);
      }
    } else {
      // Desktop
      switch (level) {
        case 1:
          return h1;
        case 2:
          return h2;
        case 3:
          return h3;
        case 4:
          return h4;
        case 5:
          return h5;
        case 6:
          return h6;
        default:
          return h1;
      }
    }
  }
}


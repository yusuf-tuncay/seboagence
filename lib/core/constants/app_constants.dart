/// 📱 App Constants - Uygulama sabitleri
///
/// Bu dosya, uygulama genelinde kullanılan sabit değerleri içerir.
/// ASLA hardcoded değerler kullanma, buradan al!
class AppConstants {
  // Uygulama Bilgileri
  static const String appName = 'Ajans Hoş İşler';
  static const String appVersion = '1.0.0';
  static const String appDescription =
      'Lüks Markaların Türkiye\'deki Stratejik Ortağı';

  // API Sabitleri
  static const String apiBaseUrl = 'https://api.seboagency.com';
  static const String apiVersion = 'v1';
  static const Duration apiTimeout = Duration(seconds: 30);
  static const int maxRetryAttempts = 3;

  // Cache Sabitleri
  static const Duration cacheExpiration = Duration(hours: 24);
  static const int maxCacheSize = 100; // MB

  // UI Sabitleri
  static const double maxContentWidth = 1400.0;

  // Mobile Breakpoints - Detaylı responsive tasarım için
  static const double smallMobileBreakpoint =
      320.0; // iPhone SE, küçük telefonlar
  static const double mediumMobileBreakpoint =
      375.0; // iPhone 12/13/14 standard
  static const double largeMobileBreakpoint =
      414.0; // iPhone Plus, büyük telefonlar
  static const double mobileBreakpoint = 768.0; // Tablet başlangıcı
  static const double tabletBreakpoint = 1024.0;
  static const double desktopBreakpoint = 1400.0;

  // Animation Sabitleri
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration fastAnimationDuration = Duration(milliseconds: 150);
  static const Duration slowAnimationDuration = Duration(milliseconds: 500);

  // Validation Sabitleri
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int maxNameLength = 100;
  static const int maxDescriptionLength = 500;

  // Error Messages
  static const String networkErrorMessage =
      'İnternet bağlantınızı kontrol edin';
  static const String serverErrorMessage =
      'Sunucu hatası oluştu, lütfen tekrar deneyin';
  static const String unknownErrorMessage = 'Bilinmeyen bir hata oluştu';

  // Success Messages
  static const String successMessage = 'İşlem başarıyla tamamlandı';
  static const String saveSuccessMessage = 'Kayıt başarıyla kaydedildi';
  static const String deleteSuccessMessage = 'Kayıt başarıyla silindi';

  // İletişim Bilgileri
  static const String companyEmail = 'seboagence@gmail.com';
  static const String companyPhone = '+90 (212) 123 45 67';
  static const String companyAddress = 'İstanbul, Türkiye';
  static const String companyWebsite = 'www.seboagency.com';
  static const String companyLinkedIn =
      'https://www.linkedin.com/in/sebnem-berkol-yuceer-1255947/';
  static const String companyInstagram = '@seboagency';

  // İletişim Sayfası Metinleri
  static const String contactPageTitle = 'İletişim';
  static const String contactPageSubtitle =
      'Projeleriniz için bizimle iletişime geçin';
  static const String contactFormTitle = 'Mesaj Gönderin';
  static const String contactFormSubtitle =
      'Size en kısa sürede dönüş yapacağız';
  static const String contactInfoTitle = 'İletişim Bilgileri';
  static const String contactInfoSubtitle = 'Bize ulaşmanın farklı yolları';

  // Private constructor - Bu sınıf instantiate edilemez
  AppConstants._();
}


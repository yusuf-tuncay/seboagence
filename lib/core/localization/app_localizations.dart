import 'package:flutter/material.dart';

/// ğŸŒ App Localizations
/// Ã‡oklu dil desteÄŸi iÃ§in ana sÄ±nÄ±f

class AppLocalizations {
  final Locale locale;
  
  AppLocalizations(this.locale);
  
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
  
  static const LocalizationsDelegate<AppLocalizations> delegate = AppLocalizationsDelegate();
  
  static const List<Locale> supportedLocales = [
    Locale('tr', 'TR'), // TÃ¼rkÃ§e
    Locale('en', 'US'), // Ä°ngilizce
    Locale('de', 'DE'), // Almanca
  ];
  
  // ğŸ  Ana Sayfa
  String get home => _localizedValues[locale.languageCode]!['home']!;
  String get about => _localizedValues[locale.languageCode]!['about']!;
  String get works => _localizedValues[locale.languageCode]!['works']!;
  String get contact => _localizedValues[locale.languageCode]!['contact']!;
  
  // ğŸ¯ Hero Section
  String get heroTitle => _localizedValues[locale.languageCode]!['heroTitle']!;
  String get heroSubtitle => _localizedValues[locale.languageCode]!['heroSubtitle']!;
  String get heroDescription => _localizedValues[locale.languageCode]!['heroDescription']!;
  String get getStarted => _localizedValues[locale.languageCode]!['getStarted']!;
  String get learnMore => _localizedValues[locale.languageCode]!['learnMore']!;
  
  // ğŸ‘¥ HakkÄ±mÄ±zda
  String get aboutTitle => _localizedValues[locale.languageCode]!['aboutTitle']!;
  String get aboutDescription => _localizedValues[locale.languageCode]!['aboutDescription']!;
  String get mission => _localizedValues[locale.languageCode]!['mission']!;
  String get vision => _localizedValues[locale.languageCode]!['vision']!;
  String get missionDescription => _localizedValues[locale.languageCode]!['missionDescription']!;
  String get visionDescription => _localizedValues[locale.languageCode]!['visionDescription']!;
  
  // ğŸ¨ HoÅŸ Ä°ÅŸler
  String get worksTitle => _localizedValues[locale.languageCode]!['worksTitle']!;
  String get worksDescription => _localizedValues[locale.languageCode]!['worksDescription']!;
  String get viewProject => _localizedValues[locale.languageCode]!['viewProject']!;
  String get allProjects => _localizedValues[locale.languageCode]!['allProjects']!;
  
  // ğŸ“ Ä°letiÅŸim
  String get contactTitle => _localizedValues[locale.languageCode]!['contactTitle']!;
  String get contactDescription => _localizedValues[locale.languageCode]!['contactDescription']!;
  String get name => _localizedValues[locale.languageCode]!['name']!;
  String get email => _localizedValues[locale.languageCode]!['email']!;
  String get phone => _localizedValues[locale.languageCode]!['phone']!;
  String get message => _localizedValues[locale.languageCode]!['message']!;
  String get sendMessage => _localizedValues[locale.languageCode]!['sendMessage']!;
  String get messageSent => _localizedValues[locale.languageCode]!['messageSent']!;
  
  // ğŸ¯ Projeler
  String get vefa => _localizedValues[locale.languageCode]!['vefa']!;
  String get sefa => _localizedValues[locale.languageCode]!['sefa']!;
  String get sifa => _localizedValues[locale.languageCode]!['sifa']!;
  String get projectDescription => _localizedValues[locale.languageCode]!['projectDescription']!;
  
  // ğŸ¢ Ajans Bilgileri
  String get agencyName => _localizedValues[locale.languageCode]!['agencyName']!;
  String get agencyTagline => _localizedValues[locale.languageCode]!['agencyTagline']!;
  String get agencyDescription => _localizedValues[locale.languageCode]!['agencyDescription']!;
  
  // ğŸ“ Konum
  String get location => _localizedValues[locale.languageCode]!['location']!;
  String get address => _localizedValues[locale.languageCode]!['address']!;
  
  // ğŸ”— Sosyal Medya
  String get followUs => _localizedValues[locale.languageCode]!['followUs']!;
  String get linkedin => _localizedValues[locale.languageCode]!['linkedin']!;
  String get instagram => _localizedValues[locale.languageCode]!['instagram']!;
  String get twitter => _localizedValues[locale.languageCode]!['twitter']!;
  String get behance => _localizedValues[locale.languageCode]!['behance']!;
  
  // âŒ Hata MesajlarÄ±
  String get notFound => _localizedValues[locale.languageCode]!['notFound']!;
  String get errorOccurred => _localizedValues[locale.languageCode]!['errorOccurred']!;
  String get tryAgain => _localizedValues[locale.languageCode]!['tryAgain']!;
  
  // ğŸ¯ Eksik Ã‡eviriler
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get currentLanguage => _localizedValues[locale.languageCode]!['currentLanguage']!;
  String get languageInfo => _localizedValues[locale.languageCode]!['languageInfo']!;
  String get languageInfoDescription => _localizedValues[locale.languageCode]!['languageInfoDescription']!;
  String get whatWeDo => _localizedValues[locale.languageCode]!['whatWeDo']!;
  String get whyWeDo => _localizedValues[locale.languageCode]!['whyWeDo']!;
  String get conferences => _localizedValues[locale.languageCode]!['conferences']!;
  String get contactUs => _localizedValues[locale.languageCode]!['contactUs']!;
  String get send => _localizedValues[locale.languageCode]!['send']!;
  String get socialMedia => _localizedValues[locale.languageCode]!['socialMedia']!;
  String get whoWeAre => _localizedValues[locale.languageCode]!['whoWeAre']!;
  String get ourWorks => _localizedValues[locale.languageCode]!['ourWorks']!;
  String get getInTouch => _localizedValues[locale.languageCode]!['getInTouch']!;
  String get ourMission => _localizedValues[locale.languageCode]!['ourMission']!;
  String get ourVision => _localizedValues[locale.languageCode]!['ourVision']!;
  String get seeAll => _localizedValues[locale.languageCode]!['seeAll']!;
  
  // ğŸ“± Form MesajlarÄ±
  String get required => _localizedValues[locale.languageCode]!['required']!;
  String get invalidEmail => _localizedValues[locale.languageCode]!['invalidEmail']!;
  String get invalidPhone => _localizedValues[locale.languageCode]!['invalidPhone']!;
  String get messageTooShort => _localizedValues[locale.languageCode]!['messageTooShort']!;
  String get messageTooLong => _localizedValues[locale.languageCode]!['messageTooLong']!;
  
  // ğŸ¨ Ã‡eviriler
  static final Map<String, Map<String, String>> _localizedValues = {
    'tr': {
      // Ana Sayfa
      'home': 'Ana Sayfa',
      'about': 'HakkÄ±mÄ±zda',
      'works': 'HoÅŸ Ä°ÅŸler',
      'contact': 'Ä°letiÅŸim',
      
      // Hero Section
      'heroTitle': 'YaratÄ±cÄ± Ajans',
      'heroSubtitle': 'MarkanÄ±zÄ± Hayata GeÃ§iriyoruz',
      'heroDescription': 'Dijital dÃ¼nyada fark yaratan Ã§Ã¶zÃ¼mlerle markanÄ±zÄ± Ã¶ne Ã§Ä±karÄ±yoruz.',
      'getStarted': 'BaÅŸlayalÄ±m',
      'learnMore': 'Daha Fazla Bilgi',
      
      // HakkÄ±mÄ±zda
      'aboutTitle': 'HakkÄ±mÄ±zda',
      'aboutDescription': 'YaratÄ±cÄ±lÄ±k ve teknolojiyi birleÅŸtirerek markalarÄ±n dijital dÃ¶nÃ¼ÅŸÃ¼mÃ¼ne Ã¶ncÃ¼lÃ¼k ediyoruz.',
      'mission': 'Misyonumuz',
      'vision': 'Vizyonumuz',
      'missionDescription': 'MarkalarÄ±n dijital dÃ¼nyada gÃ¼Ã§lÃ¼ bir varlÄ±k oluÅŸturmasÄ±na yardÄ±mcÄ± olmak.',
      'visionDescription': 'YaratÄ±cÄ±lÄ±k ve teknolojinin buluÅŸtuÄŸu bir gelecek inÅŸa etmek.',
      
      // HoÅŸ Ä°ÅŸler
      'worksTitle': 'HoÅŸ Ä°ÅŸler',
      'worksDescription': 'YaratÄ±cÄ±lÄ±ÄŸÄ±mÄ±zÄ±n en gÃ¼zel Ã¶rnekleri.',
      'viewProject': 'Projeyi GÃ¶r',
      'allProjects': 'TÃ¼m Projeler',
      
      // Ä°letiÅŸim
      'contactTitle': 'Ä°letiÅŸim',
      'contactDescription': 'Projeleriniz iÃ§in bizimle iletiÅŸime geÃ§in.',
      'name': 'Ä°sim',
      'email': 'E-posta',
      'phone': 'Telefon',
      'message': 'Mesaj',
      'sendMessage': 'Mesaj GÃ¶nder',
      'messageSent': 'MesajÄ±nÄ±z baÅŸarÄ±yla gÃ¶nderildi!',
      
      // Projeler
      'vefa': 'Vefa',
      'sefa': 'Sefa',
      'sifa': 'Åifa',
      'projectDescription': 'YaratÄ±cÄ± Ã§Ã¶zÃ¼mlerle markalarÄ±n dijital dÃ¶nÃ¼ÅŸÃ¼mÃ¼.',
      
      // Ajans Bilgileri
      'agencyName': 'Lâ€™Agence Åebo',
      'agencyTagline': 'YaratÄ±cÄ± Ajans',
      'agencyDescription': 'Dijital dÃ¼nyada fark yaratan Ã§Ã¶zÃ¼mler.',
      
      // Konum
      'location': 'Konum',
      'address': 'Ä°stanbul, TÃ¼rkiye',
      
      // Sosyal Medya
      'followUs': 'Bizi Takip Edin',
      'linkedin': 'LinkedIn',
      'instagram': 'Instagram',
      'twitter': 'Twitter',
      'behance': 'Behance',
      
      // Hata MesajlarÄ±
      'notFound': 'Sayfa BulunamadÄ±',
      'errorOccurred': 'Bir hata oluÅŸtu',
      'tryAgain': 'Tekrar Deneyin',
      
      // Form MesajlarÄ±
      'required': 'Bu alan zorunludur',
      'invalidEmail': 'GeÃ§erli bir e-posta adresi girin',
      'invalidPhone': 'GeÃ§erli bir telefon numarasÄ± girin',
      'messageTooShort': 'Mesaj Ã§ok kÄ±sa',
      'messageTooLong': 'Mesaj Ã§ok uzun',
      
      // Eksik Ã‡eviriler
      'language': 'Dil',
      'currentLanguage': 'Mevcut Dil',
      'languageInfo': 'Dil Bilgisi',
      'languageInfoDescription': 'Dil deÄŸiÅŸikliÄŸi uygulamanÄ±n tÃ¼m metinlerini etkiler. DeÄŸiÅŸiklik anÄ±nda uygulanÄ±r.',
      'whatWeDo': 'Ne YapÄ±yoruz',
      'whyWeDo': 'Neden YapÄ±yoruz',
      'conferences': 'Konferanslar',
      'contactUs': 'Ä°letiÅŸime GeÃ§in',
      'send': 'GÃ¶nder',
      'socialMedia': 'Sosyal Medya',
      'whoWeAre': 'Biz Kimiz',
      'ourWorks': 'Ä°ÅŸlerimiz',
      'getInTouch': 'Ä°letiÅŸime GeÃ§in',
      'ourMission': 'Misyonumuz',
      'ourVision': 'Vizyonumuz',
      'seeAll': 'TÃ¼mÃ¼nÃ¼ GÃ¶r',
    },
    'en': {
      // Ana Sayfa
      'home': 'Home',
      'about': 'About',
      'works': 'Works',
      'contact': 'Contact',
      
      // Hero Section
      'heroTitle': 'Creative Agency',
      'heroSubtitle': 'Bringing Your Brand to Life',
      'heroDescription': 'We make your brand stand out with creative solutions in the digital world.',
      'getStarted': 'Get Started',
      'learnMore': 'Learn More',
      
      // HakkÄ±mÄ±zda
      'aboutTitle': 'About Us',
      'aboutDescription': 'We lead the digital transformation of brands by combining creativity and technology.',
      'mission': 'Our Mission',
      'vision': 'Our Vision',
      'missionDescription': 'To help brands create a strong presence in the digital world.',
      'visionDescription': 'To build a future where creativity and technology meet.',
      
      // HoÅŸ Ä°ÅŸler
      'worksTitle': 'Our Works',
      'worksDescription': 'The finest examples of our creativity.',
      'viewProject': 'View Project',
      'allProjects': 'All Projects',
      
      // Ä°letiÅŸim
      'contactTitle': 'Contact',
      'contactDescription': 'Get in touch with us for your projects.',
      'name': 'Name',
      'email': 'Email',
      'phone': 'Phone',
      'message': 'Message',
      'sendMessage': 'Send Message',
      'messageSent': 'Your message has been sent successfully!',
      
      // Projeler
      'vefa': 'Vefa',
      'sefa': 'Sefa',
      'sifa': 'Sifa',
      'projectDescription': 'Digital transformation of brands with creative solutions.',
      
      // Ajans Bilgileri
      'agencyName': 'Ajans Hoş İşler',
      'agencyTagline': 'Creative Agency',
      'agencyDescription': 'Creative solutions that make a difference in the digital world.',
      
      // Konum
      'location': 'Location',
      'address': 'Istanbul, Turkey',
      
      // Sosyal Medya
      'followUs': 'Follow Us',
      'linkedin': 'LinkedIn',
      'instagram': 'Instagram',
      'twitter': 'Twitter',
      'behance': 'Behance',
      
      // Hata MesajlarÄ±
      'notFound': 'Page Not Found',
      'errorOccurred': 'An error occurred',
      'tryAgain': 'Try Again',
      
      // Form MesajlarÄ±
      'required': 'This field is required',
      'invalidEmail': 'Please enter a valid email address',
      'invalidPhone': 'Please enter a valid phone number',
      'messageTooShort': 'Message is too short',
      'messageTooLong': 'Message is too long',
      
      // Eksik Ã‡eviriler
      'language': 'Language',
      'currentLanguage': 'Current Language',
      'languageInfo': 'Language Info',
      'languageInfoDescription': 'Language changes affect all texts in the application. Changes are applied immediately.',
      'whatWeDo': 'What We Do',
      'whyWeDo': 'Why We Do',
      'conferences': 'Conferences',
      'contactUs': 'Contact Us',
      'send': 'Send',
      'socialMedia': 'Social Media',
      'whoWeAre': 'Who We Are',
      'ourWorks': 'Our Works',
      'getInTouch': 'Get In Touch',
      'ourMission': 'Our Mission',
      'ourVision': 'Our Vision',
      'seeAll': 'See All',
    },
    'de': {
      // Ana Sayfa
      'home': 'Startseite',
      'about': 'Ãœber uns',
      'works': 'Arbeiten',
      'contact': 'Kontakt',
      
      // Hero Section
      'heroTitle': 'Kreative Agentur',
      'heroSubtitle': 'Ihre Marke zum Leben erwecken',
      'heroDescription': 'Wir lassen Ihre Marke mit kreativen LÃ¶sungen in der digitalen Welt hervorstechen.',
      'getStarted': 'Loslegen',
      'learnMore': 'Mehr erfahren',
      
      // HakkÄ±mÄ±zda
      'aboutTitle': 'Ãœber uns',
      'aboutDescription': 'Wir fÃ¼hren die digitale Transformation von Marken durch die Verbindung von KreativitÃ¤t und Technologie.',
      'mission': 'Unsere Mission',
      'vision': 'Unsere Vision',
      'missionDescription': 'Marken dabei zu helfen, eine starke PrÃ¤senz in der digitalen Welt zu schaffen.',
      'visionDescription': 'Eine Zukunft zu schaffen, in der KreativitÃ¤t und Technologie aufeinandertreffen.',
      
      // HoÅŸ Ä°ÅŸler
      'worksTitle': 'Unsere Arbeiten',
      'worksDescription': 'Die besten Beispiele unserer KreativitÃ¤t.',
      'viewProject': 'Projekt ansehen',
      'allProjects': 'Alle Projekte',
      
      // Ä°letiÅŸim
      'contactTitle': 'Kontakt',
      'contactDescription': 'Kontaktieren Sie uns fÃ¼r Ihre Projekte.',
      'name': 'Name',
      'email': 'E-Mail',
      'phone': 'Telefon',
      'message': 'Nachricht',
      'sendMessage': 'Nachricht senden',
      'messageSent': 'Ihre Nachricht wurde erfolgreich gesendet!',
      
      // Projeler
      'vefa': 'Vefa',
      'sefa': 'Sefa',
      'sifa': 'Sifa',
      'projectDescription': 'Digitale Transformation von Marken mit kreativen LÃ¶sungen.',
      
      // Ajans Bilgileri
      'agencyName': 'Ajans Hoş İşler',
      'agencyTagline': 'Kreative Agentur',
      'agencyDescription': 'Kreative LÃ¶sungen, die in der digitalen Welt einen Unterschied machen.',
      
      // Konum
      'location': 'Standort',
      'address': 'Istanbul, TÃ¼rkei',
      
      // Sosyal Medya
      'followUs': 'Folgen Sie uns',
      'linkedin': 'LinkedIn',
      'instagram': 'Instagram',
      'twitter': 'Twitter',
      'behance': 'Behance',
      
      // Hata MesajlarÄ±
      'notFound': 'Seite nicht gefunden',
      'errorOccurred': 'Ein Fehler ist aufgetreten',
      'tryAgain': 'Erneut versuchen',
      
      // Form MesajlarÄ±
      'required': 'Dieses Feld ist erforderlich',
      'invalidEmail': 'Bitte geben Sie eine gÃ¼ltige E-Mail-Adresse ein',
      'invalidPhone': 'Bitte geben Sie eine gÃ¼ltige Telefonnummer ein',
      'messageTooShort': 'Nachricht ist zu kurz',
      'messageTooLong': 'Nachricht ist zu lang',
      
      // Eksik Ã‡eviriler
      'language': 'Sprache',
      'currentLanguage': 'Aktuelle Sprache',
      'languageInfo': 'Sprachinformationen',
      'languageInfoDescription': 'SprachÃ¤nderungen betreffen alle Texte in der Anwendung. Ã„nderungen werden sofort angewendet.',
      'whatWeDo': 'Was Wir Tun',
      'whyWeDo': 'Warum Wir Tun',
      'conferences': 'Konferenzen',
      'contactUs': 'Kontaktieren Sie Uns',
      'send': 'Senden',
      'socialMedia': 'Soziale Medien',
      'whoWeAre': 'Wer Wir Sind',
      'ourWorks': 'Unsere Arbeiten',
      'getInTouch': 'Kontakt Aufnehmen',
      'ourMission': 'Unsere Mission',
      'ourVision': 'Unsere Vision',
      'seeAll': 'Alle Anzeigen',
    },
  };
}

/// ğŸŒ App Localizations Delegate
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();
  
  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales.any((supportedLocale) =>
        supportedLocale.languageCode == locale.languageCode);
  }
  
  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }
  
  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

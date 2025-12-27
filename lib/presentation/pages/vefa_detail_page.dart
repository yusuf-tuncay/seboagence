/// ?? VEFA Projesi Detay Sayfası
///
/// Bu sayfa, VEFA projesinin detaylarını gösterir.
/// Mavi ve beyaz renk teması kullanılır.
library;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/branding.dart';
import '../../core/theme/typography.dart';
import '../../core/utils/responsive.dart';
import '../../core/services/navigation_service.dart';
import '../widgets/optimized_navigation_bar.dart';
import '../widgets/common/footer_widget.dart';

class VefaDetailPage extends ConsumerWidget {
  const VefaDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Açık gri arka plan
      body: Column(
        children: [
          const OptimizedNavigationBar(),
          Expanded(child: _VefaDetailContent()),
        ],
      ),
    );
  }
}

/// VEFA Detay İçeriği
class _VefaDetailContent extends StatelessWidget {
  const _VefaDetailContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [_HeroSection(), const FooterWidget()]),
    );
  }

  void _showImageDialog(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) {
          return PopScope(
            canPop: true,
            onPopInvokedWithResult: (didPop, result) {
              if (!didPop) {
                Navigator.of(context).pop();
              }
            },
            child: Scaffold(
              backgroundColor: Colors.black.withValues(alpha: 0.7),
              body: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: Center(
                    child: AbsorbPointer(
                      absorbing: false,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.9,
                          maxHeight: MediaQuery.of(context).size.height * 0.8,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/vefa4.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}

/// Hero Section - Mavi tema
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? Branding.spacingM : Branding.spacingXXL,
        vertical: isMobile ? Branding.spacingL : Branding.spacingXXL * 1.5,
      ),
      child: Center(
        child: Container(
          width: isMobile ? double.infinity : 1000,
          padding: EdgeInsets.all(isMobile ? 20 : 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // Proje ikonu - Mavi tema
              Container(
                padding: EdgeInsets.all(isMobile ? 16 : 24),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.school,
                  color: const Color(0xFF3B82F6),
                  size: isMobile ? 36 : 48,
                ),
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // Ana başlık
              Text(
                'VEFA Projesi',
                style: TextStyle(
                  color: const Color(0xFF1F2937),
                  fontSize: isMobile
                      ? 24.0
                      : isTablet
                      ? 32.0
                      : 40.0,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXL,
              ),

              // Proje Görseli Slider
              _ProjectImageSlider(),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXL,
              ),

              // Proje açıklama metni
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 20.0
                      : isTablet
                      ? 60.0
                      : 160.0,
                ),
                child: Text(
                  'Geçmişin Yankıları, Geleceğin Gücü: Alanya\'nın Vefa Köprüsü\n\nVefa, takvim yapraklarının geri dönüşü değil; geçmişin derin anlamlarını, yorgun hatıralarını ve o günlerin kıymetli emeğini, içinde bulunduğumuz bugüne taşıyan, ruhu olan canlı bir köprüdür. Vefa, yalnızca kişisel anıları değil, bir şehrin taşlarında saklı kalmış kolektif belleği, bir ailenin nesiller boyu süren izlerini ve bir okulun koridorlarında yankılanan öğrenci sesini yeniden ve daha güçlü duyurmanın adıdır. Bu köprü, bizi Alanya\'da kök salmış, ailemizden kalan Kız Meslek Lisesi ve Turizm Otelcilik Okulu\'nda yetişen gençlerin sadece bir meslek edinme değil, aynı zamanda bir karakter inşa etme serüvenlerine odaklanmaya davet ediyor. Bu hikâyeler, vefanın sadece hatıralara değil, aynı zamanda geleceğe duyulan güçlü inanca işaret ettiğini kanıtlar niteliktedir.',
                  style: TextStyle(
                    color: const Color(0xFF1F2937),
                    fontSize: isMobile
                        ? 12.0
                        : isTablet
                        ? 14.0
                        : 16.0,
                    fontWeight: FontWeight.w600,
                    height: isTablet ? 1.4 : 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // Slogan
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 20.0
                      : isTablet
                      ? 60.0
                      : 120.0,
                ),
                padding: EdgeInsets.all(
                  isMobile
                      ? Branding.spacingM
                      : isTablet
                      ? Branding.spacingXL
                      : Branding.spacingXXL,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  '"Geçmişin yankıları, geleceğin gücü olur."',
                  style: TextStyle(
                    color: const Color(0xFF1F2937),
                    fontSize: isMobile
                        ? 16.0
                        : isTablet
                        ? 18.0
                        : 20.0,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    height: isTablet ? 1.3 : 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // Su Kuyusu Projesi Bölümü
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: isMobile ? 10.0 : 40.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Responsive.responsiveWidget(
                  context,
                  mobile: _buildMobileSuKuyusuSection(),
                  tablet: _buildTabletSuKuyusuSection(),
                  desktop: _buildDesktopSuKuyusuSection(),
                ),
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // VEFA projesi açıklama metni
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 20.0
                      : isTablet
                      ? 60.0
                      : 160.0,
                ),
                child: Text(
                  '?? Üretmek: Bir Meslekten Öte, Bir Karakter Manifestosu\n\nOkullarımızda "üretmek" kavramı, dar anlamıyla bir beceri öğrenme eyleminin çok ötesinde, felsefi bir derinlik taşır. O, dürüstlüğü, meslek ahlakını, disiplini, sorumluluğu ve özgüveni ilmek ilmek dokuyan, adeta bir karakter manifestosudur. Gençlerimiz, özellikle de genç kadınlarımız, burada sadece mutfak, otelcilik veya el sanatları gibi meslekleri öğrenmezler; onlar, kendi emekleriyle, alın terleriyle hayata tutunmanın onurunu ve kimseye bağlı kalmamanın gücünü keşfederler. Bu üretim kültürü, onlara sadece ekonomik bağımsızlık kazandırmakla kalmaz, aynı zamanda zorluklar karşısında yılmama, çözüm odaklı olma ve çevreleri için de değer yaratma yetisi kazandırır.',
                  style: TextStyle(
                    color: const Color(0xFF1F2937),
                    fontSize: isMobile
                        ? 12.0
                        : isTablet
                        ? 14.0
                        : 16.0,
                    fontWeight: FontWeight.w600,
                    height: isTablet ? 1.3 : 1.4,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // Kota ve Organizasyon Bölümü
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 20.0
                      : isTablet
                      ? 60.0
                      : 120.0,
                ),
                padding: EdgeInsets.all(
                  isMobile
                      ? Branding.spacingM
                      : isTablet
                      ? Branding.spacingXL
                      : Branding.spacingXXL,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF), // Açık mavi
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Üstteki ikon
                    Container(
                      width: isMobile ? 48 : 60,
                      height: isMobile ? 48 : 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.handshake,
                        color: Colors.white,
                        size: isMobile ? 24 : 30,
                      ),
                    ),
                    SizedBox(
                      height: isMobile ? Branding.spacingM : Branding.spacingXL,
                    ),

                    // Başlık
                    Text(
                      '?? Bir Kentin Nazımı: Dedemizin Mirası ve Süreklilik Anlayışı',
                      style: TextStyle(
                        color: const Color(0xFF1F2937),
                        fontSize: isMobile
                            ? 20.0
                            : isTablet
                            ? 24.0
                            : 28.0,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: isMobile ? Branding.spacingM : Branding.spacingXL,
                    ),

                    // Metin içeriği
                    Text(
                      'Dr. Ali Nazım Köseoğlu (1911-1997), Alanya\'da doğmuş, İstanbul Tıp Fakültesi mezunu ve Marmara Hastanesi\'nin kurucusu olan önemli bir şahsiyettir. Doğduğu şehir Alanya\'ya duyduğu büyük sevgi ile Alantur Otel\'in kurulması, Alanyaspor\'un kurucuları arasında yer alması ve eğitim alanındaki katkıları ile şehrin modernleşmesinde kilit rol oynamıştır.',
                      style: TextStyle(
                        color: const Color(0xFF1F2937),
                        fontSize: isMobile
                            ? 12.0
                            : isTablet
                            ? 14.0
                            : 16.0,
                        fontWeight: FontWeight.w400,
                        height: isTablet ? 1.3 : 1.4,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // İkinci Bölüm - Su Kalitesi
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 20.0
                      : isTablet
                      ? 60.0
                      : 120.0,
                ),
                padding: EdgeInsets.all(
                  isMobile
                      ? Branding.spacingM
                      : isTablet
                      ? Branding.spacingXL
                      : Branding.spacingXXL,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF), // Açık mavi
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Üstteki ikon
                    Container(
                      width: isMobile ? 48 : 60,
                      height: isMobile ? 48 : 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.water_drop,
                        color: Colors.white,
                        size: isMobile ? 24 : 30,
                      ),
                    ),
                    SizedBox(
                      height: isMobile ? Branding.spacingM : Branding.spacingXL,
                    ),

                    // Başlık
                    Text(
                      '?? Sayfalarımızda Yaşayacak Olanlar: Belleğin Kayıtları',
                      style: TextStyle(
                        color: const Color(0xFF1F2937),
                        fontSize: isMobile
                            ? 20.0
                            : isTablet
                            ? 24.0
                            : 28.0,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: isMobile ? Branding.spacingM : Branding.spacingXL,
                    ),

                    // Metin içeriği
                    Text(
                      'Bu sarsılmaz vefa duygusu ve sorumlulukla oluşturduğumuz bu özel bölüm, bir dijital bellek alanı, bir hatıra sandığı olarak tasarlanmıştır. Amacımız, sadece bilgi vermek değil, aynı zamanda ruhu hissettirmektir. Bu sayfalarda şunlar yer alacak ve sürekli güncel tutulacaktır:\n\n• "Bir Kentin Nazımı" Özel Alanı: Dedemiz Ali Nazım Köseoğlu\'nun hayatına, topluma katkılarına, bilinmeyen yönlerine ve Alanya\'daki silinmez izlerine adanmış detaylı bir kronoloji.\n\n• Zaman Tünelinden Kareler: Okulun kuruluş aşamasından bugüne uzanan sürecin görsel ve yazılı kayıtları.\n\n• Vefa ve Başarı Hikâyeleri: Okuldan mezun olan öğrencilerin ve öğretmenlerin yürek ısıtan hikâyeleri.\n\n• Alanya\'nın Kültürel Notları ve Bağlantılar: Kentin tarihi, mimarisi, yöresel lezzetleri ve gelenekleri.',
                      style: TextStyle(
                        color: const Color(0xFF1F2937),
                        fontSize: isMobile
                            ? 12.0
                            : isTablet
                            ? 14.0
                            : 16.0,
                        fontWeight: FontWeight.w400,
                        height: isTablet ? 1.3 : 1.4,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // Üçüncü Bölüm - Topluluk Eğitimi
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 20.0
                      : isTablet
                      ? 60.0
                      : 120.0,
                ),
                padding: EdgeInsets.all(
                  isMobile
                      ? Branding.spacingM
                      : isTablet
                      ? Branding.spacingXL
                      : Branding.spacingXXL,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF), // Açık mavi
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Üstteki ikon
                    Container(
                      width: isMobile ? 48 : 60,
                      height: isMobile ? 48 : 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.school,
                        color: Colors.white,
                        size: isMobile ? 24 : 30,
                      ),
                    ),
                    SizedBox(
                      height: isMobile ? Branding.spacingM : Branding.spacingXL,
                    ),

                    // Başlık
                    Text(
                      '?? Metanetle Çalışan Genç Kadınlar: Toplumun Temeli',
                      style: TextStyle(
                        color: const Color(0xFF1F2937),
                        fontSize: isMobile
                            ? 20.0
                            : isTablet
                            ? 24.0
                            : 28.0,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: isMobile ? Branding.spacingM : Branding.spacingXL,
                    ),

                    // Metin içeriği
                    Text(
                      'Metanetle çalışan, üreten, topluma somut fayda sağlayan bu genç kadınlar, bir toplumun geleceğe uzanan en güçlü, en sarsılmaz temelleridir. Onların atölyelerde, mutfaklarda ya da servis alanlarında döktükleri her damla ter, toplumsal dönüşümün ve ilerlemenin de itici gücü olur. Üretimin sadece bir ekonomik faaliyet değil, aynı zamanda ahlaki ve toplumsal bir görev olduğu inancıyla yetişirler. Bu miras, vefanın sadece geçmişe değil, aynı zamanda parlak bir geleceğe de duyulan sorumluluk duygusu olduğunu gösteren en güçlü kanıttır.',
                      style: TextStyle(
                        color: const Color(0xFF1F2937),
                        fontSize: isMobile
                            ? 12.0
                            : isTablet
                            ? 14.0
                            : 16.0,
                        fontWeight: FontWeight.w400,
                        height: isTablet ? 1.3 : 1.4,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // Dördüncü Bölüm - Bütünsel Kalkınma
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 20.0
                      : isTablet
                      ? 60.0
                      : 120.0,
                ),
                padding: EdgeInsets.all(
                  isMobile
                      ? Branding.spacingM
                      : isTablet
                      ? Branding.spacingXL
                      : Branding.spacingXXL,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF), // Açık mavi
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Üstteki ikon
                    Container(
                      width: isMobile ? 48 : 60,
                      height: isMobile ? 48 : 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.trending_up,
                        color: Colors.white,
                        size: isMobile ? 24 : 30,
                      ),
                    ),
                    SizedBox(
                      height: isMobile ? Branding.spacingM : Branding.spacingXL,
                    ),

                    // Başlık
                    Text(
                      '?? Eğitimin Kaldıraç Gücü: Ali Nazım Köseoğlu\'nun Vizyonu',
                      style: TextStyle(
                        color: const Color(0xFF1F2937),
                        fontSize: isMobile
                            ? 20.0
                            : isTablet
                            ? 24.0
                            : 28.0,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: isMobile ? Branding.spacingM : Branding.spacingXL,
                    ),

                    // Metin içeriği
                    Text(
                      'Dr. Ali Nazım Köseoğlu, eğitimin toplumun kaderini değiştiren temel kaldıraç olduğuna inandı. Ali Nazım Köseoğlu Ortaokulu, Hacet Okulu ve Meziyet Köseoğlu Mesleki Eğitim Merkezi gibi kurumları şehre kazandırmıştır. Biz, bugün aynı anlayışla o mirası koruyarak, çağın gereklerine uygun olarak geliştiriyoruz. Amacımız, onun "Nazım" ruhunu, yani nezaketi, ahlakı, çalışkanlığı ve memleket sevgisini her öğrencinin kalbine nakşetmektir.',
                      style: TextStyle(
                        color: const Color(0xFF1F2937),
                        fontSize: isMobile
                            ? 12.0
                            : isTablet
                            ? 14.0
                            : 16.0,
                        fontWeight: FontWeight.w400,
                        height: isTablet ? 1.3 : 1.4,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // İyileşme Yolculuğuna Katılın Metni
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 20.0
                      : isTablet
                      ? 80.0
                      : 200.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '?? Vefa Yolculuğumuza Katılın',
                      style: TextStyle(
                        color: const Color(0xFF1F2937),
                        fontSize: isMobile
                            ? 18.0
                            : isTablet
                            ? 22.0
                            : 24.0,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(
                      height: isMobile ? Branding.spacingS : Branding.spacingL,
                    ),
                    Text(
                      'Bu büyük vefa yolculuğunda sizin de katkılarınızla ilerlemek istiyoruz. Sizin desteğiniz, eğitim mirasımızı büyütecek, gençlerimizin hayallerini gerçekleştirmelerine yardımcı olacak ve Alanya\'nın kültürel belleğini daha güçlü hale getirecektir. Birlikte, geçmişin değerlerini geleceğe taşıyan, eğitimde mükemmelliği hedefleyen bir toplum inşa edelim!',
                      style: TextStyle(
                        color: const Color(0xFF1F2937),
                        fontSize: isMobile
                            ? 12.0
                            : isTablet
                            ? 14.0
                            : 16.0,
                        fontWeight: FontWeight.w500,
                        height: isTablet ? 1.3 : 1.4,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // VEFA Fotoğrafı
              GestureDetector(
                onTap: () => _VefaDetailContent()._showImageDialog(context),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: isMobile
                        ? 20.0
                        : isTablet
                        ? 60.0
                        : 80.0,
                  ),
                  height: isMobile ? 120 : 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Semantics(
                      label: 'Vefa - Eğitim ve gelişim platformu projesi',
                      child: Image.asset(
                        'assets/images/vefa4.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFFF3F4F6),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    color: const Color(0xFF9CA3AF),
                                    size: isMobile ? 36 : 64,
                                  ),
                                  SizedBox(height: Branding.spacingM),
                                  Text(
                                    'Fotoğraf Yüklenemedi',
                                    style: TextStyle(
                                      color: const Color(0xFF6B7280),
                                      fontSize: isMobile ? 14 : 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // Alt başlık
              Text(
                'Eğitim ve Gelişim Platformu',
                style: TextStyle(
                  color: const Color(0xFF6B7280),
                  fontSize: isMobile
                      ? 16.0
                      : isTablet
                      ? 18.0
                      : 20.0,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // Kategori etiketi
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
                  ),
                ),
                child: const Text(
                  'Eğitim Projesi',
                  style: TextStyle(
                    color: Color(0xFF3B82F6),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Su Kuyusu Bölümü - Mobile
  Widget _buildMobileSuKuyusuSection() {
    return Column(
      children: [
        // Sol bölüm - Mavi panel
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Color(0xFFEFF6FF), // Açık mavi
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ali Nazım Köseoğlu Eğitim Vakfı',
                style: TextStyle(
                  color: const Color(0xFF1F2937),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Dr. Ali Nazım Köseoğlu\'nun eğitim mirasını yaşatan vakfımız, Alanya\'daki Kız Meslek Lisesi ve Turizm Otelcilik Okulu\'nda eğitim gören gençlerin mesleki gelişimlerini destekliyoruz.',
                style: TextStyle(
                  color: const Color(0xFF6B7280),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
        // Sağ bölüm - Şifa fotoğrafı
        Container(
          width: double.infinity,
          height: 200,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Semantics(
              label:
                  'Alinazım Köseoğlu - Vefa projesi kurucusu ve eğitim uzmanı',
              child: Image.asset(
                'assets/images/alinazimkoseogli.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFF3F4F6),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: const Color(0xFF6B7280),
                            size: 48,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Fotoğraf Yüklenemedi',
                            style: TextStyle(
                              color: const Color(0xFF6B7280),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Su Kuyusu Bölümü - Tablet
  Widget _buildTabletSuKuyusuSection() {
    return IntrinsicHeight(
      child: Row(
        children: [
          // Sol bölüm - Mavi panel
          Expanded(
            flex: 1,
            child: Container(
              constraints: const BoxConstraints(minHeight: 300),
              padding: const EdgeInsets.all(32),
              decoration: const BoxDecoration(
                color: Color(0xFFEFF6FF), // Açık mavi
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ali Nazım Köseoğlu Eğitim Vakfı',
                    style: TextStyle(
                      color: const Color(0xFF1F2937),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Flexible(
                    child: Text(
                      'Dr. Ali Nazım Köseoğlu\'nun eğitim mirasını yaşatan vakfımız, Alanya\'daki Kız Meslek Lisesi ve Turizm Otelcilik Okulu\'nda eğitim gören gençlerin mesleki gelişimlerini destekliyoruz.',
                      style: TextStyle(
                        color: const Color(0xFF6B7280),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Sağ bölüm - Şifa fotoğrafı
          Expanded(
            flex: 1,
            child: Container(
              constraints: const BoxConstraints(minHeight: 300),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: Semantics(
                  label:
                      'Alinazım Köseoğlu - Vefa projesi kurucusu ve eğitim uzmanı',
                  child: Image.asset(
                    'assets/images/alinazimkoseogli.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFF3F4F6),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                color: const Color(0xFF6B7280),
                                size: 64,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Fotoğraf Yüklenemedi',
                                style: TextStyle(
                                  color: const Color(0xFF6B7280),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Su Kuyusu Bölümü - Desktop
  Widget _buildDesktopSuKuyusuSection() {
    return Row(
      children: [
        // Sol bölüm - Mavi panel
        Expanded(
          flex: 1,
          child: Container(
            height: 350,
            padding: const EdgeInsets.all(40),
            decoration: const BoxDecoration(
              color: Color(0xFFEFF6FF), // Açık mavi
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ali Nazım Köseoğlu Eğitim Vakfı',
                  style: TextStyle(
                    color: const Color(0xFF1F2937),
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Dr. Ali Nazım Köseoğlu\'nun eğitim mirasını yaşatan vakfımız, Alanya\'daki Kız Meslek Lisesi ve Turizm Otelcilik Okulu\'nda eğitim gören gençlerin mesleki gelişimlerini destekliyor, karakter eğitimlerini güçlendiriyoruz.',
                  style: TextStyle(
                    color: const Color(0xFF6B7280),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Sağ bölüm - Şifa fotoğrafı
        Expanded(
          flex: 1,
          child: Container(
            height: 350,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Image.asset(
                'assets/images/alinazimkoseogli.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFF3F4F6),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: const Color(0xFF6B7280),
                            size: 80,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Fotoğraf Yüklenemedi',
                            style: TextStyle(
                              color: const Color(0xFF6B7280),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Proje Görseli Slider Widget
class _ProjectImageSlider extends StatefulWidget {
  const _ProjectImageSlider();

  @override
  State<_ProjectImageSlider> createState() => _ProjectImageSliderState();
}

class _ProjectImageSliderState extends State<_ProjectImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  // Proje görselleri listesi
  final List<Map<String, dynamic>> _projectImages = [
    {
      'title': 'VEFA Projesi',
      'description': 'Eğitim ve Gelişim Platformu',
      'image': 'assets/images/vefa1.jpg', // VEFA slider görseli
    },
    {
      'title': 'Kız Meslek Lisesi',
      'description': 'Mesleki Eğitim ve Karakter Gelişimi',
      'image': 'assets/images/vefa2.jpg',
    },
    {
      'title': 'Turizm Otelcilik Okulu',
      'description': 'Hizmet Sektöründe Uzmanlık',
      'image': 'assets/images/vefa3.jpg',
    },
    {
      'title': 'Öğrenci Atölyeleri',
      'description': 'Pratik Eğitim ve Uygulama',
      'image': 'assets/images/vefa5.jpg',
    },
    {
      'title': 'VEFA Kampusü',
      'description': 'Eğitim ve Sosyal Yaşam Alanı',
      'image': 'assets/images/vefa6.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        int nextIndex = (_currentIndex + 1) % _projectImages.length;
        _pageController.animateToPage(
          nextIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Column(
      children: [
        // Slider Container
        SizedBox(
          height: isMobile
              ? 300
              : isTablet
              ? 400
              : 450,
          child: GestureDetector(
            onTap: () {
              // Otomatik olarak sonraki slide'a geç
              int nextIndex = (_currentIndex + 1) % _projectImages.length;
              _pageController.animateToPage(
                nextIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _projectImages.length,
              itemBuilder: (context, index) {
                final imageData = _projectImages[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Görsel
                        Image.asset(
                          imageData['image'],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(
                                      0xFF3B82F6,
                                    ).withValues(alpha: 0.8),
                                    const Color(
                                      0xFF2563EB,
                                    ).withValues(alpha: 0.9),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      color: Colors.white,
                                      size: isMobile ? 48 : 80,
                                    ),
                                    SizedBox(height: Branding.spacingM),
                                    Text(
                                      'Fotoğraf Yüklenemedi',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isMobile ? 16 : 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        // Gradient overlay
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.3),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        SizedBox(height: Branding.spacingL),

        // Navigation Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _projectImages.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentIndex == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? const Color(0xFF3B82F6)
                    : const Color(0xFF3B82F6).withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),

        SizedBox(height: Branding.spacingM),
      ],
    );
  }
}

// Footer Widget
// ignore: unused_element
class _FooterWidget extends StatelessWidget {
  const _FooterWidget(this.context);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Responsive.responsivePadding(
        context,
        mobile: const EdgeInsets.all(16.0),
        tablet: const EdgeInsets.all(20.0),
        desktop: const EdgeInsets.all(24.0),
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF131B2E), // Dark blue-grey
      ),
      child: Responsive.responsiveWidget(
        context,
        mobile: _buildMobileFooter(context),
        tablet: _buildTabletFooter(context),
        desktop: _buildDesktopFooter(context),
      ),
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      children: [
        _buildMobileFooterLogo(),
        const SizedBox(height: 20),
        _buildMobileFooterLinks(),
        const SizedBox(height: 20),
        _buildMobileFooterContact(),
        const SizedBox(height: 20),
        _buildMobileFooterBottom(),
      ],
    );
  }

  Widget _buildTabletFooter(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _buildTabletFooterLogo()),
            const SizedBox(width: 20),
            Expanded(flex: 1, child: _buildTabletFooterLinks()),
            const SizedBox(width: 20),
            Expanded(flex: 1, child: _buildTabletFooterContact()),
          ],
        ),
        const SizedBox(height: 24),
        _buildTabletFooterBottom(),
      ],
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _buildFooterLogo()),
            const SizedBox(width: 32),
            Expanded(flex: 1, child: _buildFooterLinks()),
            const SizedBox(width: 32),
            Expanded(flex: 1, child: _buildFooterContact()),
          ],
        ),
        const SizedBox(height: 24),
        _buildFooterBottom(),
      ],
    );
  }

  Widget _buildMobileFooterLogo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Logo - Mobile'da ortalanmış
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 6.0,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Text(
                'ŞEBO',
                style: TextStyle(
                  color: Color(0xFF4A4A4A),
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: const Color(0xFFE0E0E0),
                    width: 1.0,
                  ),
                ),
              ),
              child: const Text(
                'creative agency',
                style: TextStyle(
                  color: Color(0xFFE0E0E0),
                  fontWeight: FontWeight.w300,
                  fontSize: 9,
                  letterSpacing: 1.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Açıklama - Mobile'da küçük ve ortalanmış
        Text(
          'Yaratıcı ve yenilikçi çözümler sunan premium dijital ajans olarak, müşterilerimize en iyi hizmeti sunmayı hedefliyoruz.',
          textAlign: TextAlign.center,
          style: AppTypography.bodyMedium.copyWith(
            color: const Color(0xFFB0B0B0),
            height: 1.4,
            fontSize: 10,
          ),
        ),

        const SizedBox(height: 16),

        // Sosyal medya - Mobile'da kompakt
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMobileSocialIcon(Icons.facebook, 'https://facebook.com'),
            const SizedBox(width: 8),
            _buildMobileSocialIcon(Icons.camera_alt, 'https://instagram.com'),
            const SizedBox(width: 8),
            _buildMobileSocialIcon(Icons.business, 'https://linkedin.com'),
            const SizedBox(width: 8),
            _buildMobileSocialIcon(Icons.chat, 'https://twitter.com'),
          ],
        ),
      ],
    );
  }

  Widget _buildTabletFooterLogo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 7.0,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: const Text(
                'ŞEBO',
                style: TextStyle(
                  color: Color(0xFF4A4A4A),
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 7.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: const Color(0xFFE0E0E0),
                    width: 1.2,
                  ),
                ),
              ),
              child: const Text(
                'creative agency',
                style: TextStyle(
                  color: Color(0xFFE0E0E0),
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                  letterSpacing: 1.1,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Açıklama
        Text(
          'Yaratıcı ve yenilikçi çözümler sunan premium dijital ajans olarak, müşterilerimize en iyi hizmeti sunmayı hedefliyoruz.',
          style: AppTypography.bodyMedium.copyWith(
            color: const Color(0xFFB0B0B0),
            height: 1.5,
            fontSize: 11,
          ),
        ),

        const SizedBox(height: 16),

        // Sosyal medya
        Row(
          children: [
            _buildTabletSocialIcon(Icons.facebook, 'https://facebook.com'),
            const SizedBox(width: 12),
            _buildTabletSocialIcon(Icons.camera_alt, 'https://instagram.com'),
            const SizedBox(width: 12),
            _buildTabletSocialIcon(Icons.business, 'https://linkedin.com'),
            const SizedBox(width: 12),
            _buildTabletSocialIcon(Icons.chat, 'https://twitter.com'),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterLogo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 6.0,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Text(
                'ŞEBO',
                style: TextStyle(
                  color: Color(0xFF4A4A4A),
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: const Color(0xFFE0E0E0),
                    width: 1.0,
                  ),
                ),
              ),
              child: const Text(
                'creative agency',
                style: TextStyle(
                  color: Color(0xFFE0E0E0),
                  fontWeight: FontWeight.w300,
                  fontSize: 10,
                  letterSpacing: 1.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Açıklama
        Text(
          'Yaratıcı ve yenilikçi çözümler sunan premium dijital ajans olarak, müşterilerimize en iyi hizmeti sunmayı hedefliyoruz.',
          style: AppTypography.bodyMedium.copyWith(
            color: const Color(0xFFB0B0B0),
            height: 1.4,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 16),

        // Sosyal medya
        Row(
          children: [
            _buildSocialIcon(Icons.facebook, 'https://facebook.com'),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.camera_alt, 'https://instagram.com'),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.business, 'https://linkedin.com'),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.chat, 'https://twitter.com'),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileSocialIcon(IconData icon, String url) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Icon(icon, color: const Color(0xFFE0E0E0), size: 14),
    );
  }

  Widget _buildTabletSocialIcon(IconData icon, String url) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Icon(icon, color: const Color(0xFFE0E0E0), size: 16),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Icon(icon, color: const Color(0xFFE0E0E0), size: 16),
    );
  }

  Widget _buildMobileFooterLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Hızlı Linkler',
          style: AppTypography.h6.copyWith(
            color: const Color(0xFFE0E0E0),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),
        _buildMobileFooterLink('Ana Sayfa'),
        _buildMobileFooterLink('Hakkımızda'),
        _buildMobileFooterLink('Projelerimiz'),
        _buildMobileFooterLink('Konferanslar'),
        _buildMobileFooterLink('İletişim'),
      ],
    );
  }

  Widget _buildTabletFooterLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hızlı Linkler',
          style: AppTypography.h6.copyWith(
            color: const Color(0xFFE0E0E0),
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 14),
        _buildTabletFooterLink('Ana Sayfa'),
        _buildTabletFooterLink('Hakkımızda'),
        _buildTabletFooterLink('Projelerimiz'),
        _buildTabletFooterLink('Konferanslar'),
        _buildTabletFooterLink('İletişim'),
      ],
    );
  }

  Widget _buildFooterLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hızlı Linkler',
          style: AppTypography.h6.copyWith(
            color: const Color(0xFFE0E0E0),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('Ana Sayfa'),
        _buildFooterLink('Hakkımızda'),
        _buildFooterLink('Projelerimiz'),
        _buildFooterLink('Konferanslar'),
        _buildFooterLink('İletişim'),
      ],
    );
  }

  Widget _buildMobileFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: _HoverableFooterLink(
        text: text,
        fontSize: 10,
        textAlign: TextAlign.center,
        onTap: () {
          switch (text) {
            case 'Ana Sayfa':
              NavigationService.goToHome();
              break;
            case 'Hakkımızda':
              NavigationService.goToAbout();
              break;
            case 'Projelerimiz':
              NavigationService.goToWorks();
              break;
            case 'Konferanslar':
              NavigationService.goToConferences();
              break;
            case 'İletişim':
              NavigationService.goToContact();
              break;
          }
        },
      ),
    );
  }

  Widget _buildTabletFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: _HoverableFooterLink(
        text: text,
        fontSize: 11,
        onTap: () {
          switch (text) {
            case 'Ana Sayfa':
              NavigationService.goToHome();
              break;
            case 'Hakkımızda':
              NavigationService.goToAbout();
              break;
            case 'Projelerimiz':
              NavigationService.goToWorks();
              break;
            case 'Konferanslar':
              NavigationService.goToConferences();
              break;
            case 'İletişim':
              NavigationService.goToContact();
              break;
          }
        },
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: _HoverableFooterLink(
        text: text,
        fontSize: 12,
        onTap: () {
          switch (text) {
            case 'Ana Sayfa':
              NavigationService.goToHome();
              break;
            case 'Hakkımızda':
              NavigationService.goToAbout();
              break;
            case 'Projelerimiz':
              NavigationService.goToWorks();
              break;
            case 'Konferanslar':
              NavigationService.goToConferences();
              break;
            case 'İletişim':
              NavigationService.goToContact();
              break;
          }
        },
      ),
    );
  }

  Widget _buildMobileFooterContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'İletişim',
          style: AppTypography.h6.copyWith(
            color: const Color(0xFFE0E0E0),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),
        _buildMobileContactItem(Icons.email, 'sby@gmail.com'),
        _buildMobileContactItem(Icons.phone, '+90 (212) 123 45 67'),
        _buildMobileContactItem(Icons.location_on, 'İstanbul, Türkiye'),
      ],
    );
  }

  Widget _buildTabletFooterContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'İletişim',
          style: AppTypography.h6.copyWith(
            color: const Color(0xFFE0E0E0),
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 14),
        _buildTabletContactItem(Icons.email, 'sby@gmail.com'),
        _buildTabletContactItem(Icons.phone, '+90 (212) 123 45 67'),
        _buildTabletContactItem(Icons.location_on, 'İstanbul, Türkiye'),
      ],
    );
  }

  Widget _buildFooterContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'İletişim',
          style: AppTypography.h6.copyWith(
            color: const Color(0xFFE0E0E0),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 16),
        _buildContactItem(Icons.email, 'sby@gmail.com'),
        _buildContactItem(Icons.phone, '+90 (212) 123 45 67'),
        _buildContactItem(Icons.location_on, 'İstanbul, Türkiye'),
      ],
    );
  }

  Widget _buildMobileContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFFB0B0B0), size: 12),
          const SizedBox(width: 6),
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppTypography.bodyMedium.copyWith(
              color: const Color(0xFFB0B0B0),
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFB0B0B0), size: 14),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTypography.bodyMedium.copyWith(
              color: const Color(0xFFB0B0B0),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFB0B0B0), size: 14),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTypography.bodyMedium.copyWith(
              color: const Color(0xFFB0B0B0),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFooterBottom() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF2A2A2A), width: 1)),
      ),
      child: Column(
        children: [
          Text(
            '© 2024 Ajans Hoş İşler. Tüm hakları saklıdır.',
            textAlign: TextAlign.center,
            style: AppTypography.bodySmall.copyWith(
              color: const Color(0xFF808080),
              fontSize: 8,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Geliştirildi ?? ile',
            textAlign: TextAlign.center,
            style: AppTypography.bodySmall.copyWith(
              color: const Color(0xFF808080),
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletFooterBottom() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF2A2A2A), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2024 Ajans Hoş İşler. Tüm hakları saklıdır.',
            style: AppTypography.bodySmall.copyWith(
              color: const Color(0xFF808080),
              fontSize: 9,
            ),
          ),
          Text(
            'Geliştirildi ?? ile',
            style: AppTypography.bodySmall.copyWith(
              color: const Color(0xFF808080),
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterBottom() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF2A2A2A), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2024 Ajans Hoş İşler. Tüm hakları saklıdır.',
            style: AppTypography.bodySmall.copyWith(
              color: const Color(0xFF808080),
              fontSize: 10,
            ),
          ),
          Text(
            'Geliştirildi ?? ile',
            style: AppTypography.bodySmall.copyWith(
              color: const Color(0xFF808080),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

// Hoverable Footer Link Widget
class _HoverableFooterLink extends StatefulWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final VoidCallback onTap;

  const _HoverableFooterLink({
    required this.text,
    required this.fontSize,
    this.textAlign,
    required this.onTap,
  });

  @override
  State<_HoverableFooterLink> createState() => _HoverableFooterLinkState();
}

class _HoverableFooterLinkState extends State<_HoverableFooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: Text(
            widget.text,
            textAlign: widget.textAlign,
            style: AppTypography.bodyMedium.copyWith(
              color: _isHovered ? Colors.white : const Color(0xFFB0B0B0),
              fontSize: widget.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}



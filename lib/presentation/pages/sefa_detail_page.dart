/// ?? SEFA Projesi Detay Sayfası
///
/// Bu sayfa, SEFA projesinin detaylarını gösterir.
/// Mor ve beyaz renk teması kullanılır.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/branding.dart';
import '../../core/theme/typography.dart';
import '../../core/utils/responsive.dart';
import '../../core/services/navigation_service.dart';
import '../widgets/optimized_navigation_bar.dart';
import '../widgets/common/footer_widget.dart';

class SefaDetailPage extends ConsumerWidget {
  const SefaDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Açık gri arka plan
      body: Column(
        children: [
          const OptimizedNavigationBar(),
          Expanded(child: _SefaDetailContent()),
        ],
      ),
    );
  }
}

/// SEFA Detay İçeriği
class _SefaDetailContent extends StatelessWidget {
  const _SefaDetailContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [_HeroSection(), const FooterWidget()]),
    );
  }
}

/// Hero Section - Mor tema
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
              // Proje ikonu - Mor tema
              Container(
                padding: EdgeInsets.all(isMobile ? 16 : 24),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.palette,
                  color: const Color(0xFF8B5CF6),
                  size: isMobile ? 36 : 48,
                ),
              ),
              SizedBox(
                height: isMobile ? Branding.spacingM : Branding.spacingXXL,
              ),

              // Ana başlık
              Text(
                'SEFA Projesi',
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
                  'Sefa: İyiliğin Estetik Formu ve Keyifli Yaşam Sanatı\n\n"Bir dokunun içinde zarafet, bir detayda huzur saklıdır." Bu felsefeden yola çıkan Sefa bölümü, basit bir alışveriş deneyiminin ötesinde, keyifli ve bilinçli bir yaşam biçimini davet ediyor. Burada üretim, sadece bir ihtiyacı karşılamaktan çıkıp, hayatın ve emeğin bir kutlama hâline dönüşür.\n\nŞifadan İpek ve Huzurun Dokunuşu\n\nSefa\'nın kalbinde, ürünlerin taşıdığı derin anlam yatar. Koleksiyonumuzdaki her bir parça—ister boynunuza narin bir dokunuş katacak bir fular, ister yaşam alanınıza dinginlik getirecek bir ev tekstili ürünü, isterse küçük ama anlamlı bir obje olsun—Şifada İpek gibi doğal malzemelerle, özenle ve sevgiyle üretilir. Amacımız, bu estetik objeler aracılığıyla insanın günlük yaşamına somut bir şifa ve keyif taşımaktır.\n\n"Güzellik, yalnızca görmekle değil; hissetmekle başlar." Biz, estetiğin yalnızca görsel bir algı değil, aynı zamanda ruhsal bir dinginlik olduğunu savunuyoruz. Bu yüzden her ürün, dokunduğunuzda size huzur veren, baktığınızda içinizi ferahlatan bir sanat eseri niteliğindedir.\n\nKadim Zanaatların ve Kadın Emeğinin Temsili\n\nSefa Koleksiyonu\'nun ardındaki en güçlü değer, kadın üreticilerin titiz el emeğidir. Bu ürünler fabrikasyonun soğukluğundan uzaktır; her bir ilmek, her bir boyama ve her bir dikiş, bir kadının emeğe, doğaya ve kadim zanaatlara duyduğu derin sevginin ve saygının somut bir temsilidir. Bu emeğin karşılığı olarak, sadece yüksek kaliteli ürünler sunmakla kalmıyor, aynı zamanda adil ve destekleyici üretim süreçlerine de odaklanıyoruz.\n\nSefa bölümü, modern yaşamın karmaşasında kaybolan "keyifli yaşam" kavramını, sade ve bilinçli bir güzellik anlayışıyla yeniden tanımlar. Burada gördüğünüz her şey doğaldır, kullanılan malzemenin kökeninden üretim sürecine kadar her aşamada şeffaflık esastır ve her bir parçanın kendine ait, yaşanmış bir hikâyesiyle hayat bulur.',
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

              // Alt başlık
              Text(
                'Yaratıcı Tasarım ve Sanat Çözümleri',
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
                  color: const Color(0xFF8B5CF6).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
                  ),
                ),
                child: const Text(
                  'Tasarım Projesi',
                  style: TextStyle(
                    color: Color(0xFF8B5CF6),
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



/// ?? Works Page - Projeler sayfası
///
/// Bu sayfa, Hoş İşler platformundaki projeleri gösterir.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/branding.dart';
import '../../core/theme/typography.dart';
import '../../core/utils/responsive.dart';
import '../../core/services/navigation_service.dart';
import '../widgets/optimized_navigation_bar.dart';
import '../widgets/common/footer_widget.dart';
import 'sifa_ipek_detail_page.dart';

class WorksPage extends ConsumerWidget {
  const WorksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF131B2E),
      body: Column(
        children: [
          const OptimizedNavigationBar(),
          Expanded(child: _WorksPageContent()),
        ],
      ),
    );
  }
}

/// Works Page Content
class _WorksPageContent extends StatelessWidget {
  const _WorksPageContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _HeroSection(),
          _ChaptersSection(),
          _ProjectsSection(),
          const FooterWidget(),
        ],
      ),
    );
  }
}

/// Hero Section
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? Branding.spacingL : Branding.spacingXXL,
        vertical: isMobile ? Branding.spacingXXL : Branding.spacingXXL * 2,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF131B2E), Color(0xFF1A237E)],
        ),
      ),
      child: Column(
        children: [
          // Ana başlık
          Text(
            'Hoş İşler',
            style: TextStyle(
              color: Branding.white,
              fontSize: isMobile
                  ? 36.0
                  : isTablet
                  ? 48.0
                  : 64.0,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? Branding.spacingM : Branding.spacingL),

          // Alt başlık
          Text(
            'Yaratıcı Projeler, Anlamlı Sonuçlar',
            style: TextStyle(
              color: Branding.white.withValues(alpha: 0.9),
              fontSize: isMobile
                  ? 18.0
                  : isTablet
                  ? 22.0
                  : 28.0,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? Branding.spacingXL : Branding.spacingXXL),

          // Açıklama
          Text(
            'Hoş İşler platformumuzda, sosyal sorumluluk ve yaratıcılığı birleştiren projelerimizi keşfedin. Her proje, topluma değer katma amacıyla tasarlanmıştır.',
            style: TextStyle(
              color: Branding.white.withValues(alpha: 0.8),
              fontSize: isMobile ? 16.0 : 18.0,
              fontWeight: FontWeight.w400,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Chapters Section
class _ChaptersSection extends StatelessWidget {
  const _ChaptersSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isMobile ? Branding.spacingL : Branding.spacingXXL,
      ),
      child: Column(
        children: [
          Text(
            'Chapter\'larımız',
            style: TextStyle(
              color: Branding.white,
              fontSize: isMobile ? 28.0 : 36.0,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Branding.spacingS),
          Text(
            'Her chapter\'ın kendine özgü hikayesi ve amacı var',
            style: TextStyle(
              color: Branding.white.withValues(alpha: 0.7),
              fontSize: isMobile ? 16.0 : 18.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Branding.spacingXXL),

          Responsive.responsiveWidget(
            context,
            mobile: _buildMobileChapters(context),
            tablet: _buildTabletChapters(context),
            desktop: _buildDesktopChapters(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileChapters(BuildContext context) {
    return Column(
      children: [
        _buildChapterCard(
          title: 'Şifa',
          description: 'Kadın çiftçilerin ürünlerini değere dönüştürme projesi',
          color: Branding.primary,
          icon: Icons.healing,
          context: context,
        ),
        SizedBox(height: Branding.spacingL),
        _buildChapterCard(
          title: 'Vefa',
          description:
              'Alanya\'daki ailemden kalan okullar ve Alanya ile ilgili projeler',
          color: Branding.secondary,
          icon: Icons.school,
          context: context,
        ),
        SizedBox(height: Branding.spacingL),
        _buildChapterCard(
          title: 'Sefa',
          description: 'Şifa ipeği ile üretilen keyifli ürünlerden oluşan seri',
          color: Branding.primary,
          icon: Icons.spa,
          context: context,
        ),
      ],
    );
  }

  Widget _buildTabletChapters(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildChapterCard(
                title: 'Şifa',
                description:
                    'Kadın çiftçilerin ürünlerini değere dönüştürme projesi',
                color: Branding.primary,
                icon: Icons.healing,
                context: context,
              ),
            ),
            SizedBox(width: Branding.spacingL),
            Expanded(
              child: _buildChapterCard(
                title: 'Vefa',
                description:
                    'Alanya\'daki ailemden kalan okullar ve Alanya ile ilgili projeler',
                color: Branding.secondary,
                icon: Icons.school,
                context: context,
              ),
            ),
          ],
        ),
        SizedBox(height: Branding.spacingL),
        Row(
          children: [
            Expanded(
              child: _buildChapterCard(
                title: 'Sefa',
                description:
                    'Şifa ipeği ile üretilen keyifli ürünlerden oluşan seri',
                color: Branding.primary,
                icon: Icons.spa,
                context: context,
              ),
            ),
            SizedBox(width: Branding.spacingL),
            Expanded(child: Container()), // Boş alan
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopChapters(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildChapterCard(
            title: 'Şifa',
            description:
                'Kadın çiftçilerin ürünlerini değere dönüştürme projesi',
            color: Branding.primary,
            icon: Icons.healing,
            context: context,
          ),
        ),
        SizedBox(width: Branding.spacingL),
        Expanded(
          child: _buildChapterCard(
            title: 'Vefa',
            description:
                'Alanya\'daki ailemden kalan okullar ve Alanya ile ilgili projeler',
            color: Branding.secondary,
            icon: Icons.school,
            context: context,
          ),
        ),
        SizedBox(width: Branding.spacingL),
        Expanded(
          child: _buildChapterCard(
            title: 'Sefa',
            description:
                'Şifa ipeği ile üretilen keyifli ürünlerden oluşan seri',
            color: Branding.primary,
            icon: Icons.spa,
            context: context,
          ),
        ),
      ],
    );
  }

  Widget _buildChapterCard({
    required String title,
    required String description,
    required Color color,
    required IconData icon,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        // Proje detay sayfalarına yönlendirme
        if (title == 'Şifa') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SifaIpekDetailPage()),
          );
        } else if (title == 'Vefa') {
          NavigationService.goToVefa();
        } else if (title == 'Sefa') {
          NavigationService.goToSefa();
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(Branding.spacingXL),
          decoration: BoxDecoration(
            color: Branding.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(Branding.borderRadiusL),
            border: Border.all(
              color: Branding.white.withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(Branding.spacingL),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(Branding.borderRadiusM),
                ),
                child: Icon(icon, color: Branding.white, size: 32.0),
              ),
              SizedBox(height: Branding.spacingL),
              Text(
                title,
                style: const TextStyle(
                  color: Branding.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Branding.spacingS),
              Text(
                description,
                style: TextStyle(
                  color: Branding.white.withValues(alpha: 0.8),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Branding.spacingL),
              OutlinedButton(
                onPressed: () {
                  if (title == 'Şifa') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SifaIpekDetailPage()),
                    );
                  } else if (title == 'Vefa') {
                    NavigationService.goToVefa();
                  } else if (title == 'Sefa') {
                    NavigationService.goToSefa();
                  }
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Branding.white,
                  side: BorderSide(color: Branding.white.withValues(alpha: 0.8)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: Branding.spacingL,
                    vertical: Branding.spacingM,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Branding.borderRadiusM),
                  ),
                ),
                child: const Text(
                  'Detayları Gör',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Branding.white,
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

/// Projects Section
class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isMobile ? Branding.spacingL : Branding.spacingXXL,
      ),
      decoration: BoxDecoration(color: Branding.white.withValues(alpha: 0.05)),
      child: Column(
        children: [
          Text(
            'Projelerimiz',
            style: TextStyle(
              color: Branding.white,
              fontSize: isMobile ? 28.0 : 36.0,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Branding.spacingS),
          Text(
            'Her proje, topluma değer katma amacıyla tasarlanmıştır',
            style: TextStyle(
              color: Branding.white.withValues(alpha: 0.7),
              fontSize: isMobile ? 16.0 : 18.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Branding.spacingXXL),

          Responsive.responsiveWidget(
            context,
            mobile: _buildMobileProjects(),
            tablet: _buildTabletProjects(),
            desktop: _buildDesktopProjects(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProjects() {
    return Column(
      children: [
        _buildProjectCard(
          title: 'Şifa İpek',
          chapter: 'Şifa',
          description:
              'Hatay\'da yetişen Barış ipeği ve Hatay depreminden sonra köylerde yaşayan kadın çiftçilerin tezgahlarında dokudukları ürünlerin değere dönüştürülmesi',
          color: Branding.primary,
          features: [
            'Kadın güçlendirme',
            'Sürdürülebilir üretim',
            'Yerel ekonomi',
          ],
          stats: '50+ Kadın Çiftçi',
        ),
        SizedBox(height: Branding.spacingL),
        _buildProjectCard(
          title: 'Alanya Eğitim Projesi',
          chapter: 'Vefa',
          description:
              'Alanya\'daki ailemden kalan kız meslek lisesi ve turizm otelcilik okulu öğrencilerine yönelik projeler',
          color: Branding.secondary,
          features: ['Mesleki eğitim', 'Turizm sektörü', 'Genç istihdam'],
          stats: '200+ Öğrenci',
        ),
        SizedBox(height: Branding.spacingL),
        _buildProjectCard(
          title: 'Sefa Ürün Serisi',
          chapter: 'Sefa',
          description:
              'Şifa ipeği ile üretilen keyifli ürünlerden oluşan özel seri',
          color: Branding.primary,
          features: ['El yapımı ürünler', 'Doğal malzemeler', 'Özel tasarım'],
          stats: '100+ Ürün',
        ),
      ],
    );
  }

  Widget _buildTabletProjects() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildProjectCard(
                title: 'Şifa İpek',
                chapter: 'Şifa',
                description:
                    'Kadın çiftçilerin ürünlerini değere dönüştürme projesi',
                color: Branding.primary,
                features: [
                  'Kadın güçlendirme',
                  'Sürdürülebilir üretim',
                  'Yerel ekonomi',
                ],
                stats: '50+ Kadın Çiftçi',
              ),
            ),
            SizedBox(width: Branding.spacingL),
            Expanded(
              child: _buildProjectCard(
                title: 'Alanya Eğitim Projesi',
                chapter: 'Vefa',
                description:
                    'Alanya\'daki okullar ve öğrencilere yönelik projeler',
                color: Branding.secondary,
                features: ['Mesleki eğitim', 'Turizm sektörü', 'Genç istihdam'],
                stats: '200+ Öğrenci',
              ),
            ),
          ],
        ),
        SizedBox(height: Branding.spacingL),
        Row(
          children: [
            Expanded(
              child: _buildProjectCard(
                title: 'Sefa Ürün Serisi',
                chapter: 'Sefa',
                description:
                    'Şifa ipeği ile üretilen keyifli ürünlerden oluşan seri',
                color: Branding.primary,
                features: [
                  'El yapımı ürünler',
                  'Doğal malzemeler',
                  'Özel tasarım',
                ],
                stats: '100+ Ürün',
              ),
            ),
            SizedBox(width: Branding.spacingL),
            Expanded(child: Container()), // Boş alan
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopProjects() {
    return Row(
      children: [
        Expanded(
          child: _buildProjectCard(
            title: 'Şifa İpek',
            chapter: 'Şifa',
            description:
                'Kadın çiftçilerin ürünlerini değere dönüştürme projesi',
            color: Branding.primary,
            features: [
              'Kadın güçlendirme',
              'Sürdürülebilir üretim',
              'Yerel ekonomi',
            ],
            stats: '50+ Kadın Çiftçi',
          ),
        ),
        SizedBox(width: Branding.spacingL),
        Expanded(
          child: _buildProjectCard(
            title: 'Alanya Eğitim Projesi',
            chapter: 'Vefa',
            description: 'Alanya\'daki okullar ve öğrencilere yönelik projeler',
            color: Branding.secondary,
            features: ['Mesleki eğitim', 'Turizm sektörü', 'Genç istihdam'],
            stats: '200+ Öğrenci',
          ),
        ),
        SizedBox(width: Branding.spacingL),
        Expanded(
          child: _buildProjectCard(
            title: 'Sefa Ürün Serisi',
            chapter: 'Sefa',
            description:
                'Şifa ipeği ile üretilen keyifli ürünlerden oluşan seri',
            color: Branding.primary,
            features: ['El yapımı ürünler', 'Doğal malzemeler', 'Özel tasarım'],
            stats: '100+ Ürün',
          ),
        ),
      ],
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String chapter,
    required String description,
    required Color color,
    required List<String> features,
    required String stats,
  }) {
    return Container(
      padding: EdgeInsets.all(Branding.spacingXL),
      decoration: BoxDecoration(
        color: Branding.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Branding.borderRadiusL),
        border: Border.all(
          color: Branding.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chapter etiketi ve istatistik
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  chapter,
                  style: TextStyle(
                    color: color,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  stats,
                  style: TextStyle(
                    color: color,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Branding.spacingL),

          // Proje başlığı
          Text(
            title,
            style: const TextStyle(
              color: Branding.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: Branding.spacingS),

          // Proje açıklaması
          Text(
            description,
            style: TextStyle(
              color: Branding.white.withValues(alpha: 0.8),
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          SizedBox(height: Branding.spacingL),

          // Özellikler listesi
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: features
                .map(
                  (feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            feature,
                            style: TextStyle(
                              color: Branding.white.withValues(alpha: 0.7),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

/// Footer Widget
// ignore: unused_element
class _FooterWidget extends StatelessWidget {
  const _FooterWidget();

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



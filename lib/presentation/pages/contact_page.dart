/// 📧 Contact Page - Ultra-Optimized İletişim sayfası
///
/// Bu sayfa, maksimum performans ve kullanıcı deneyimi için optimize edilmiş iletişim bilgilerini gösterir.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/branding.dart';
import '../../core/theme/typography.dart';
import '../../core/utils/responsive.dart';
import '../../core/constants/app_constants.dart';
import '../../core/services/navigation_service.dart';
import '../widgets/optimized_navigation_bar.dart';
import '../widgets/common/footer_widget.dart';

class ContactPage extends ConsumerWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF131B2E),
      body: Column(
        children: [
          const OptimizedNavigationBar(),
          Expanded(child: _ContactPageContent()),
        ],
      ),
    );
  }
}

/// Optimized Contact Page Content
///
/// Bu widget, performans için ayrılmış ve optimize edilmiş içerik widget'ıdır.
class _ContactPageContent extends StatelessWidget {
  const _ContactPageContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _HeroSection(),
          _ContactCardsSection(),
          _SocialMediaSection(),
          _MapSection(),
          const FooterWidget(),
        ],
      ),
    );
  }
}

/// Hero Section - Optimized
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
        vertical: isMobile ? Branding.spacingL : Branding.spacingXXL * 2,
      ),
      decoration: const BoxDecoration(color: Color(0xFF131B2E)),
      child: Column(
        children: [
          Text(
            AppConstants.contactPageTitle,
            style: TextStyle(
              color: Branding.white,
              fontSize: isMobile
                  ? 28.0
                  : isTablet
                  ? 40.0
                  : 48.0,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? Branding.spacingS : Branding.spacingL),
          Text(
            AppConstants.contactPageSubtitle,
            style: TextStyle(
              color: Branding.white.withValues(alpha: 0.9),
              fontSize: isMobile
                  ? 14.0
                  : isTablet
                  ? 18.0
                  : 20.0,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? Branding.spacingL : Branding.spacingXXL),
          _ContactSummary(),
        ],
      ),
    );
  }
}

/// Contact Summary - Optimized
class _ContactSummary extends StatelessWidget {
  const _ContactSummary();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.all(
        isMobile ? Branding.spacingM : Branding.spacingXL,
      ),
      decoration: BoxDecoration(
        color: Branding.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(Branding.borderRadiusL),
        border: Border.all(
          color: Branding.white.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _SummaryItem(
          icon: Icons.email,
          title: 'E-posta',
          content: AppConstants.companyEmail,
          color: Branding.primary,
          isMobile: true,
        ),
        SizedBox(height: Branding.spacingM),
        _SummaryItem(
          icon: Icons.phone,
          title: 'Telefon',
          content: AppConstants.companyPhone,
          color: Branding.secondary,
          isMobile: true,
        ),
        SizedBox(height: Branding.spacingM),
        _SummaryItem(
          icon: Icons.location_on,
          title: 'Adres',
          content: AppConstants.companyAddress,
          color: Branding.secondary,
          isMobile: true,
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _SummaryItem(
          icon: Icons.email,
          title: 'E-posta',
          content: AppConstants.companyEmail,
          color: Branding.primary,
          isMobile: false,
        ),
        _SummaryItem(
          icon: Icons.phone,
          title: 'Telefon',
          content: AppConstants.companyPhone,
          color: Branding.secondary,
          isMobile: false,
        ),
        _SummaryItem(
          icon: Icons.location_on,
          title: 'Adres',
          content: AppConstants.companyAddress,
          color: Branding.secondary,
          isMobile: false,
        ),
      ],
    );
  }
}

/// Summary Item - Optimized
class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.icon,
    required this.title,
    required this.content,
    required this.color,
    required this.isMobile,
  });

  final IconData icon;
  final String title;
  final String content;
  final Color color;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return isMobile ? _buildMobileItem() : _buildDesktopItem();
  }

  Widget _buildMobileItem() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Branding.spacingM,
        vertical: Branding.spacingS,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Branding.borderRadiusM),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(Branding.spacingS),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(Branding.borderRadiusS),
            ),
            child: Icon(icon, color: Branding.white, size: 20.0),
          ),
          SizedBox(width: Branding.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Branding.white.withValues(alpha: 0.7),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  content,
                  style: TextStyle(
                    color: Branding.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopItem() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(Branding.spacingL),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(Branding.borderRadiusM),
          ),
          child: Icon(icon, color: Branding.white, size: 32.0),
        ),
        SizedBox(height: Branding.spacingS),
        Text(
          title,
          style: TextStyle(
            color: Branding.white.withValues(alpha: 0.8),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: Branding.spacingXS),
        Text(
          content,
          style: TextStyle(
            color: Branding.white,
            fontSize: 13.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Contact Cards Section - Optimized
class _ContactCardsSection extends StatelessWidget {
  const _ContactCardsSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Padding(
      padding: EdgeInsets.all(
        isMobile ? Branding.spacingM : Branding.spacingXXL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.contactInfoTitle,
            style: TextStyle(
              color: Branding.white,
              fontSize: isMobile
                  ? 24.0
                  : isTablet
                  ? 32.0
                  : 36.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: Branding.spacingXS),
          Text(
            AppConstants.contactInfoSubtitle,
            style: TextStyle(
              color: Branding.white.withValues(alpha: 0.7),
              fontSize: isMobile ? 14.0 : 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: isMobile ? Branding.spacingL : Branding.spacingXXL),
          _ContactCardsGrid(),
        ],
      ),
    );
  }
}

/// Contact Cards Grid - Optimized
class _ContactCardsGrid extends StatelessWidget {
  const _ContactCardsGrid();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    if (isMobile) {
      return const _MobileContactCards();
    } else if (isTablet) {
      return const _TabletContactCards();
    } else {
      return const _DesktopContactCards();
    }
  }
}

/// Mobile Contact Cards - Optimized
class _MobileContactCards extends StatelessWidget {
  const _MobileContactCards();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ContactCard(
          title: 'E-posta Adresimiz',
          content: AppConstants.companyEmail,
          description: 'Projeleriniz için bizimle iletişime geçin',
          icon: Icons.email,
          color: Branding.secondary,
          actionText: 'E-posta Gönder',
          onTap: () => _launchEmail(context),
        ),
        SizedBox(height: Branding.spacingL),
        _ContactCard(
          title: 'Telefon Numaramız',
          content: AppConstants.companyPhone,
          description: 'Kullanıma Kapalı - Hemen arayın, size yardımcı olalım',
          icon: Icons.phone,
          color: Branding.secondary,
          actionText: 'Kullanıma Kapalı',
          onTap: () {}, // Boş fonksiyon - tıklanamaz
        ),
        SizedBox(height: Branding.spacingL),
        _ContactCard(
          title: 'Ofis Adresimiz',
          content: AppConstants.companyAddress,
          description: 'Kullanıma Kapalı - Ofisimizi ziyaret edebilirsiniz',
          icon: Icons.location_on,
          color: Branding.secondary,
          actionText: 'Kullanıma Kapalı',
          onTap: () {}, // Boş fonksiyon - tıklanamaz
        ),
      ],
    );
  }
}

/// Tablet Contact Cards - Optimized
class _TabletContactCards extends StatelessWidget {
  const _TabletContactCards();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _ContactCard(
                title: 'E-posta Adresimiz',
                content: AppConstants.companyEmail,
                description: 'Projeleriniz için bizimle iletişime geçin',
                icon: Icons.email,
                color: Branding.secondary,
                actionText: 'E-posta Gönder',
                onTap: () => _launchEmail(context),
              ),
            ),
            SizedBox(width: Branding.spacingL),
            Expanded(
              child: _ContactCard(
                title: 'Telefon Numaramız',
                content: AppConstants.companyPhone,
                description:
                    'Kullanıma Kapalı - Hemen arayın, size yardımcı olalım',
                icon: Icons.phone,
                color: Branding.secondary,
                actionText: 'Kullanıma Kapalı',
                onTap: () {}, // Boş fonksiyon - tıklanamaz
              ),
            ),
          ],
        ),
        SizedBox(height: Branding.spacingL),
        _ContactCard(
          title: 'Ofis Adresimiz',
          content: AppConstants.companyAddress,
          description: 'Kullanıma Kapalı - Ofisimizi ziyaret edebilirsiniz',
          icon: Icons.location_on,
          color: Branding.secondary,
          actionText: 'Kullanıma Kapalı',
          onTap: () {}, // Boş fonksiyon - tıklanamaz
        ),
      ],
    );
  }
}

/// Desktop Contact Cards - Optimized
class _DesktopContactCards extends StatelessWidget {
  const _DesktopContactCards();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ContactCard(
            title: 'E-posta Adresimiz',
            content: AppConstants.companyEmail,
            description: 'Projeleriniz için bizimle iletişime geçin',
            icon: Icons.email,
            color: Branding.secondary,
            actionText: 'E-posta Gönder',
            onTap: () => _launchEmail(context),
          ),
        ),
        SizedBox(width: Branding.spacingL),
        Expanded(
          child: _ContactCard(
            title: 'Telefon Numaramız',
            content: AppConstants.companyPhone,
            description:
                'Kullanıma Kapalı - Hemen arayın, size yardımcı olalım',
            icon: Icons.phone,
            color: Branding.secondary,
            actionText: 'Kullanıma Kapalı',
            onTap: () {}, // Boş fonksiyon - tıklanamaz
          ),
        ),
        SizedBox(width: Branding.spacingL),
        Expanded(
          child: _ContactCard(
            title: 'Ofis Adresimiz',
            content: AppConstants.companyAddress,
            description: 'Kullanıma Kapalı - Ofisimizi ziyaret edebilirsiniz',
            icon: Icons.location_on,
            color: Branding.secondary,
            actionText: 'Kullanıma Kapalı',
            onTap: () {}, // Boş fonksiyon - tıklanamaz
          ),
        ),
      ],
    );
  }
}

/// Contact Card - Ultra-Optimized
class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.title,
    required this.content,
    required this.description,
    required this.icon,
    required this.color,
    required this.actionText,
    required this.onTap,
  });

  final String title;
  final String content;
  final String description;
  final IconData icon;
  final Color color;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.all(
        isMobile ? Branding.spacingL : Branding.spacingXL,
      ),
      decoration: BoxDecoration(
        color: Branding.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(Branding.borderRadiusL),
        border: Border.all(
          color: Branding.white.withValues(alpha: 0.15),
          width: 1,
        ),
        boxShadow: isMobile
            ? null
            : [
                BoxShadow(
                  color: Branding.white.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(
                  isMobile ? Branding.spacingS : Branding.spacingM,
                ),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(Branding.borderRadiusM),
                ),
                child: Icon(
                  icon,
                  color: Branding.white,
                  size: isMobile ? 24.0 : 28.0,
                ),
              ),
              SizedBox(width: Branding.spacingM),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Branding.white,
                    fontSize: isMobile ? 18.0 : 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? Branding.spacingM : Branding.spacingL),
          Text(
            content,
            style: TextStyle(
              color: Branding.white,
              fontSize: isMobile ? 16.0 : 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: Branding.spacingS),
          Text(
            description,
            style: TextStyle(
              color: Branding.white.withValues(alpha: 0.7),
              fontSize: isMobile ? 13.0 : 14.0,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          SizedBox(height: isMobile ? Branding.spacingL : Branding.spacingXL),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onTap,
              icon: Icon(
                Icons.arrow_forward,
                size: isMobile ? 16.0 : 18.0,
                color: actionText == 'Kullanıma Kapalı'
                    ? Colors.red
                    : Branding.white,
              ),
              label: Text(
                actionText,
                style: TextStyle(
                  color: actionText == 'Kullanıma Kapalı'
                      ? Colors.red
                      : Branding.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Branding.white,
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? Branding.spacingS : Branding.spacingM,
                  horizontal: Branding.spacingL,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Branding.borderRadiusM),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Social Media Section - Optimized
class _SocialMediaSection extends StatelessWidget {
  const _SocialMediaSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isMobile ? Branding.spacingM : Branding.spacingXXL,
      ),
      decoration: BoxDecoration(color: Branding.white.withValues(alpha: 0.05)),
      child: Column(
        children: [
          Text(
            'Sosyal Medyada Takip Edin',
            style: TextStyle(
              color: Branding.white,
              fontSize: isMobile ? 20.0 : 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: Branding.spacingXS),
          Text(
            'Güncel projelerimizi ve haberlerimizi takip edin',
            style: TextStyle(
              color: Branding.white.withValues(alpha: 0.7),
              fontSize: isMobile ? 12.0 : 16.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? Branding.spacingL : Branding.spacingXL),
          isMobile ? _buildMobileSocialButtons() : _buildDesktopSocialButtons(),
        ],
      ),
    );
  }

  Widget _buildMobileSocialButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _SocialButton(
              icon: Icons.link,
              title: 'Website',
              url: AppConstants.companyWebsite,
              color: Branding.primary,
              isMobile: true,
            ),
            _SocialButton(
              icon: Icons.business,
              title: 'LinkedIn',
              url: AppConstants.companyLinkedIn,
              color: Branding.secondary,
              isMobile: true,
            ),
          ],
        ),
        SizedBox(height: Branding.spacingM),
        _SocialButton(
          icon: Icons.camera_alt,
          title: 'Instagram',
          url: AppConstants.companyInstagram,
          color: Branding.secondary,
          isMobile: true,
        ),
      ],
    );
  }

  Widget _buildDesktopSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          icon: Icons.link,
          title: 'Website',
          url: AppConstants.companyWebsite,
          color: Branding.primary,
          isMobile: false,
        ),
        SizedBox(width: Branding.spacingL),
        _SocialButton(
          icon: Icons.business,
          title: 'LinkedIn',
          url: AppConstants.companyLinkedIn,
          color: Branding.secondary,
          isMobile: false,
        ),
        SizedBox(width: Branding.spacingL),
        _SocialButton(
          icon: Icons.camera_alt,
          title: 'Instagram',
          url: AppConstants.companyInstagram,
          color: Branding.secondary,
          isMobile: false,
        ),
      ],
    );
  }
}

/// Social Button - Optimized
class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.icon,
    required this.title,
    required this.url,
    required this.color,
    required this.isMobile,
  });

  final IconData icon;
  final String title;
  final String url;
  final Color color;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Container(
        padding: EdgeInsets.all(
          isMobile ? Branding.spacingM : Branding.spacingL,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(Branding.borderRadiusM),
          border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
        ),
        child: isMobile ? _buildMobileButton() : _buildDesktopButton(),
      ),
    );
  }

  Widget _buildMobileButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Branding.white, size: 20.0),
        SizedBox(width: Branding.spacingS),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Branding.white,
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (title == 'Instagram' || title == 'Website')
              Text(
                'Kullanıma Kapalı',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 8.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopButton() {
    return Column(
      children: [
        Icon(icon, color: Branding.white, size: 32.0),
        SizedBox(height: Branding.spacingS),
        Text(
          title,
          style: const TextStyle(
            color: Branding.white,
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (title == 'Instagram' || title == 'Website')
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              'Kullanıma Kapalı',
              style: const TextStyle(
                color: Colors.red,
                fontSize: 9.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
      ],
    );
  }
}

/// Map Section - Optimized
class _MapSection extends StatelessWidget {
  const _MapSection();

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
            'Konumumuz',
            style: TextStyle(
              color: Branding.white,
              fontSize: isMobile ? 24.0 : 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: Branding.spacingL),
          Container(
            height: isMobile ? 200.0 : 300.0,
            decoration: BoxDecoration(
              color: Branding.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(Branding.borderRadiusL),
              border: Border.all(
                color: Branding.white.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_off,
                    color: Branding.white.withValues(alpha: 0.5),
                    size: 48.0,
                  ),
                  SizedBox(height: Branding.spacingM),
                  Text(
                    'Konum Hizmeti',
                    style: TextStyle(
                      color: Branding.white.withValues(alpha: 0.9),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: Branding.spacingS),
                  Text(
                    'Şu anda kullanıma kapalı',
                    style: TextStyle(
                      color: Branding.white.withValues(alpha: 0.7),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: Branding.spacingM),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Branding.secondary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Branding.secondary.withValues(alpha: 0.5),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'Yakında Aktif',
                      style: TextStyle(
                        color: Branding.secondary,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Utility Functions - Optimized
void _launchEmail(BuildContext context) async {
  final isMobile = Responsive.isMobile(context);

  if (isMobile) {
    // Mobil cihazlarda Gmail uygulamasına yönlendir
    final Uri gmailUri = Uri(
      scheme: 'gmail',
      path: 'co',
      query: 'to=${AppConstants.companyEmail}&subject=İletişim&body=Merhaba,',
    );

    if (await canLaunchUrl(gmailUri)) {
      await launchUrl(gmailUri);
    } else {
      // Gmail uygulaması yoksa varsayılan e-posta uygulamasını aç
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: AppConstants.companyEmail,
        query: 'subject=İletişim&body=Merhaba,',
      );
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      }
    }
  } else {
    // Tablet ve desktop'ta Gmail web sitesine yönlendir
    final Uri gmailWebUri = Uri.parse(
      'https://mail.google.com/mail/?view=cm&fs=1&to=${AppConstants.companyEmail}&su=İletişim&body=Merhaba,',
    );

    if (await canLaunchUrl(gmailWebUri)) {
      await launchUrl(gmailWebUri);
    }
  }
}

void _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
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
        _buildMobileContactItem(Icons.email, 'seboagence@gmail.com'),
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
        _buildTabletContactItem(Icons.email, 'seboagence@gmail.com'),
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
        _buildContactItem(Icons.email, 'seboagence@gmail.com'),
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
            'Geliştirildi ❤️ ile',
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
            'Geliştirildi ❤️ ile',
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
            'Geliştirildi ❤️ ile',
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


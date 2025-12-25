import 'package:flutter/material.dart';
import '../../core/theme/branding.dart';
import '../../core/theme/typography.dart';
import '../../core/utils/responsive.dart';

/// MyApp sayfası - Uygulama hakkında bilgiler
class MyAppPageView extends StatelessWidget {
  const MyAppPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(context),

            // App Features Section
            _buildFeaturesSection(context),

            // Technology Stack Section
            _buildTechnologySection(context),

            // Development Info Section
            _buildDevelopmentSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: Responsive.screenHeight(context) * 0.6,
      padding: Responsive.responsivePadding(context),
      decoration: BoxDecoration(gradient: Branding.primaryGradient),
      child: Center(
        child: Responsive.responsiveWidget(
          context,
          mobile: _buildMobileHero(context),
          tablet: _buildTabletHero(context),
          desktop: _buildDesktopHero(context),
        ),
      ),
    );
  }

  Widget _buildMobileHero(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'MyApp',
          style: AppTypography.h1.copyWith(color: Branding.white, fontSize: 32),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Branding.spacingL),
        Text(
          'Ajans Hoş İşler Web Uygulaması',
          style: AppTypography.h4.copyWith(
            color: Branding.white.withValues(alpha: 0.9),
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTabletHero(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'MyApp',
          style: AppTypography.h1.copyWith(color: Branding.white, fontSize: 40),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Branding.spacingL),
        Text(
          'Ajans Hoş İşler Web Uygulaması',
          style: AppTypography.h4.copyWith(
            color: Branding.white.withValues(alpha: 0.9),
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDesktopHero(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'MyApp',
          style: AppTypography.h1.copyWith(color: Branding.white, fontSize: 48),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Branding.spacingL),
        Text(
          'Ajans Hoş İşler Web Uygulaması',
          style: AppTypography.h4.copyWith(
            color: Branding.white.withValues(alpha: 0.9),
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    return Container(
      padding: Responsive.responsivePadding(context),
      child: Column(
        children: [
          Text(
            'Uygulama Özellikleri',
            style: AppTypography.h2.copyWith(
              fontSize: Responsive.responsiveFontSize(
                context,
                mobile: 24,
                tablet: 28,
                desktop: 32,
              ),
            ),
          ),
          const SizedBox(height: Branding.spacingXL),
          Responsive.responsiveWidget(
            context,
            mobile: _buildMobileFeatures(context),
            tablet: _buildTabletFeatures(context),
            desktop: _buildDesktopFeatures(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFeatures(BuildContext context) {
    return Column(
      children: [
        _buildFeatureCard(
          context,
          'Modern Tasarım',
          'Navy blue ve platin renk paleti ile şık tasarım',
        ),
        const SizedBox(height: Branding.spacingL),
        _buildFeatureCard(
          context,
          'Responsive',
          'Tüm cihazlarda mükemmel görünüm',
        ),
        const SizedBox(height: Branding.spacingL),
        _buildFeatureCard(
          context,
          'Clean Architecture',
          'Modüler ve sürdürülebilir kod yapısı',
        ),
      ],
    );
  }

  Widget _buildTabletFeatures(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureCard(
            context,
            'Modern Tasarım',
            'Navy blue ve gold renk paleti ile şık tasarım',
          ),
        ),
        const SizedBox(width: Branding.spacingL),
        Expanded(
          child: _buildFeatureCard(
            context,
            'Responsive',
            'Tüm cihazlarda mükemmel görünüm',
          ),
        ),
        const SizedBox(width: Branding.spacingL),
        Expanded(
          child: _buildFeatureCard(
            context,
            'Clean Architecture',
            'Modüler ve sürdürülebilir kod yapısı',
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopFeatures(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureCard(
            context,
            'Modern Tasarım',
            'Navy blue ve gold renk paleti ile şık tasarım',
          ),
        ),
        const SizedBox(width: Branding.spacingXL),
        Expanded(
          child: _buildFeatureCard(
            context,
            'Responsive',
            'Tüm cihazlarda mükemmel görünüm',
          ),
        ),
        const SizedBox(width: Branding.spacingXL),
        Expanded(
          child: _buildFeatureCard(
            context,
            'Clean Architecture',
            'Modüler ve sürdürülebilir kod yapısı',
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String description,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Branding.radiusL),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Branding.spacingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTypography.h5.copyWith(color: Branding.primaryColor),
            ),
            const SizedBox(height: Branding.spacingM),
            Text(
              description,
              style: AppTypography.bodyMedium.copyWith(
                color: Branding.darkGrey.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechnologySection(BuildContext context) {
    return Container(
      padding: Responsive.responsivePadding(context),
      color: Branding.lightGrey,
      child: Column(
        children: [
          Text(
            'Teknoloji Stack',
            style: AppTypography.h2.copyWith(
              fontSize: Responsive.responsiveFontSize(
                context,
                mobile: 24,
                tablet: 28,
                desktop: 32,
              ),
            ),
          ),
          const SizedBox(height: Branding.spacingXL),
          Wrap(
            spacing: Branding.spacingM,
            runSpacing: Branding.spacingM,
            children: [
              _buildTechChip('Flutter Web'),
              _buildTechChip('Dart'),
              _buildTechChip('Riverpod'),
              _buildTechChip('Auto Route'),
              _buildTechChip('Freezed'),
              _buildTechChip('Get It'),
              _buildTechChip('Material 3'),
              _buildTechChip('Responsive Design'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTechChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Branding.spacingM,
        vertical: Branding.spacingS,
      ),
      decoration: BoxDecoration(
        color: Branding.primaryColor,
        borderRadius: BorderRadius.circular(Branding.radiusM),
      ),
      child: Text(
        label,
        style: AppTypography.bodyMedium.copyWith(
          color: Branding.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDevelopmentSection(BuildContext context) {
    return Container(
      padding: Responsive.responsivePadding(context),
      child: Column(
        children: [
          Text(
            'Geliştirme Bilgileri',
            style: AppTypography.h2.copyWith(
              fontSize: Responsive.responsiveFontSize(
                context,
                mobile: 24,
                tablet: 28,
                desktop: 32,
              ),
            ),
          ),
          const SizedBox(height: Branding.spacingXL),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Branding.radiusL),
            ),
            child: Padding(
              padding: const EdgeInsets.all(Branding.spacingXL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('Framework', 'Flutter Web'),
                  _buildInfoRow('Mimari', 'Clean Architecture'),
                  _buildInfoRow('State Management', 'Riverpod'),
                  _buildInfoRow('Routing', 'Auto Route'),
                  _buildInfoRow('Dependency Injection', 'Get It'),
                  _buildInfoRow(
                    'Code Generation',
                    'Freezed + JSON Serializable',
                  ),
                  _buildInfoRow('Tema', 'Material 3 + Custom Branding'),
                  _buildInfoRow('Responsive', 'Custom Responsive System'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Branding.spacingM),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                color: Branding.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTypography.bodyMedium.copyWith(
                color: Branding.darkGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


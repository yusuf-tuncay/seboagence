/// ℹ️ About Repository Implementation - Hakkımızda repository implementasyonu
///
/// Bu sınıf, hakkımızda verilerini yönetir.
library;

import '../../domain/entities/about_entity.dart';
import '../../domain/repositories/about_repository.dart';
import '../models/about_model.dart';

class AboutRepositoryImpl implements AboutRepository {
  // Mock data - gerçek uygulamada API'den gelecek
  static final AboutModel _mockAbout = AboutModel(
    id: '1',
    title: 'Ajans Hoş İşler',
    description: 'Yaratıcı ve yenilikçi çözümler sunan dijital ajans',
    imageUrl: 'https://via.placeholder.com/600x400',
    mission: 'Müşterilerimize en iyi dijital deneyimi sunmak',
    vision: 'Dijital dünyada öncü olmak',
    values: 'Yaratıcılık, Kalite, Güvenilirlik, İnovasyon',
    achievements: [
      '100+ Başarılı Proje',
      '50+ Mutlu Müşteri',
      '5 Yıllık Deneyim',
      'Award Winning Agency',
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 365)),
    updatedAt: DateTime.now().subtract(const Duration(days: 7)),
  );

  @override
  Future<AboutEntity> getAboutInfo() async {
    // Simüle edilmiş network gecikmesi
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockAbout.toEntity();
  }

  @override
  Future<void> refreshAboutInfo() async {
    await Future.delayed(const Duration(milliseconds: 200));
    // Gerçek uygulamada API'den yeni veriler çekilecek
  }
}





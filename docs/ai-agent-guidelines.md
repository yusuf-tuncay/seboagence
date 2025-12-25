# 🤖 AI Agent Guidelines - Ajans Hoş İşler Project

Bu dokümantasyon, Cursor ve diğer AI ajanlarının Ajans Hoş İşler Flutter projesinde çalışırken izlemesi gereken kuralları, standartları ve best practices'leri detaylı bir şekilde açıklar.

## 📋 İçindekiler
- [Proje Genel Bakış](#proje-genel-bakış)
- [AI Agent Kuralları](#ai-agent-kuralları)
- [Kod Yazım Standartları](#kod-yazım-standartları)
- [Architecture Kuralları](#architecture-kuralları)
- [UI/UX Standartları](#uiux-standartları)
- [Error Handling](#error-handling)
- [Testing Kuralları](#testing-kuralları)
- [Git Workflow](#git-workflow)
- [Debugging Rehberi](#debugging-rehberi)

## 🎯 Proje Genel Bakış

### Proje Kimliği
- **Proje Adı**: Ajans Hoş İşler - Creative Agency Flutter App
- **Marka**: Lüks markaların Türkiye'deki stratejik ortağı
- **Hedef**: Premium, profesyonel, responsive Flutter uygulaması
- **Platform**: iOS, Android, Web

### Teknik Stack
- **Framework**: Flutter 3.16.0+
- **Language**: Dart 3.2.0+
- **State Management**: Riverpod 2.4.9+
- **Routing**: Auto Route 7.8.4+
- **DI**: GetIt 7.6.4+
- **Code Generation**: Freezed, JSON Serializable
- **Architecture**: Clean Architecture

## 🤖 AI Agent Kuralları

### 1. Temel Prensipler
- **ASLA** mevcut mimariyi bozma
- **ASLA** renk paletini değiştirme (Platin + Navy Blue)
- **ASLA** Clean Architecture katmanlarını karıştırma
- **HER ZAMAN** responsive design uygula
- **HER ZAMAN** error handling ekle
- **HER ZAMAN** Riverpod kullan

### 2. Kod Yazım Kuralları
```dart
// ✅ DOĞRU - Bu şekilde yaz
class ProjectCard extends ConsumerWidget {
  final Project project;
  final VoidCallback? onTap;
  final bool isLoading;

  const ProjectCard({
    super.key,
    required this.project,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: isLoading ? null : onTap,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildImage(),
          _buildTitle(),
          _buildDescription(),
        ],
      ),
    );
  }
}

// ❌ YANLIŞ - Bu şekilde yazma
class ProjectCard extends StatelessWidget {
  final Project project;
  ProjectCard(this.project);
  
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(project.title),
        ],
      ),
    );
  }
}
```

### 3. Dosya Organizasyonu Kuralları
```
lib/
├── core/                    # Temel sistem - ASLA değiştirme
│   ├── constants/          # Sabitler
│   ├── di/                 # Dependency Injection
│   ├── routing/            # Route yapılandırması
│   ├── services/           # Servisler
│   ├── theme/              # Tema sistemi - ASLA değiştirme
│   ├── ui/                 # UI yardımcıları
│   └── utils/              # Yardımcı fonksiyonlar
├── data/                   # Veri katmanı
│   ├── datasources/        # Veri kaynakları
│   ├── models/             # Veri modelleri
│   └── repositories/       # Repository implementasyonları
├── domain/                 # İş mantığı katmanı
│   ├── entities/           # İş nesneleri
│   ├── repositories/       # Repository arayüzleri
│   └── usecases/           # İş mantığı use case'leri
├── features/               # Özellik bazlı modüller
│   ├── home/              # Ana sayfa
│   ├── about/              # Hakkımızda
│   ├── works/              # Projeler
│   └── contact/            # İletişim
└── presentation/           # Sunum katmanı
    ├── pages/             # Sayfalar
    ├── widgets/           # Widget'lar
    └── layouts/           # Layout'lar
```

## 🎨 Kod Yazım Standartları

### 1. Widget Yapısı
```dart
// ✅ DOĞRU Widget yapısı
class CustomWidget extends ConsumerWidget {
  // 1. Final değişkenler
  final String title;
  final VoidCallback? onTap;
  final bool isLoading;

  // 2. Constructor
  const CustomWidget({
    super.key,
    required this.title,
    this.onTap,
    this.isLoading = false,
  });

  // 3. Build metodu
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: _buildContent(),
    );
  }

  // 4. Private metodlar (alt çizgi ile başla)
  Widget _buildContent() {
    return Column(
      children: [
        _buildTitle(),
        _buildButton(),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(title);
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: isLoading ? null : onTap,
      child: Text('Button'),
    );
  }
}
```

### 2. State Management (Riverpod)
```dart
// ✅ DOĞRU Riverpod kullanımı
// Provider tanımı
final projectProvider = StateNotifierProvider<ProjectNotifier, ProjectState>(
  (ref) => ProjectNotifier(getIt()),
);

// StateNotifier
class ProjectNotifier extends StateNotifier<ProjectState> {
  final GetProjectsUseCase _getProjectsUseCase;
  
  ProjectNotifier(this._getProjectsUseCase) : super(const ProjectState.initial());

  Future<void> loadProjects() async {
    state = const ProjectState.loading();
    try {
      final projects = await _getProjectsUseCase();
      state = ProjectState.loaded(projects);
    } catch (e) {
      state = ProjectState.error(e.toString());
    }
  }
}

// State tanımı
@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = _Initial;
  const factory ProjectState.loading() = _Loading;
  const factory ProjectState.loaded(List<Project> projects) = _Loaded;
  const factory ProjectState.error(String message) = _Error;
}

// Widget'da kullanım
class ProjectsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectProvider);
    
    return projectState.when(
      initial: () => const EmptyState(),
      loading: () => const LoadingWidget(),
      loaded: (projects) => ProjectGrid(projects: projects),
      error: (message) => ErrorWidget(message: message),
    );
  }
}
```

### 3. Responsive Design
```dart
// ✅ DOĞRU Responsive kullanımı
class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktop ?? tablet ?? mobile;
        } else if (constraints.maxWidth >= 768) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}

// Kullanım
ResponsiveWidget(
  mobile: MobileLayout(),
  tablet: TabletLayout(),
  desktop: DesktopLayout(),
)
```

## 🏗️ Architecture Kuralları

### 1. Clean Architecture Katmanları
```dart
// ✅ DOĞRU katman ayrımı
// Domain Layer - İş mantığı
abstract class ProjectRepository {
  Future<List<Project>> getProjects();
  Future<Project> getProjectById(String id);
}

// Data Layer - Veri katmanı
class ProjectRepositoryImpl implements ProjectRepository {
  final ApiService _apiService;
  final LocalDataSource _localDataSource;
  
  ProjectRepositoryImpl(this._apiService, this._localDataSource);
  
  @override
  Future<List<Project>> getProjects() async {
    try {
      final projects = await _apiService.getProjects();
      return projects.map((json) => ProjectModel.fromJson(json)).toList();
    } catch (e) {
      return await _localDataSource.getCachedProjects();
    }
  }
}

// Presentation Layer - UI katmanı
class ProjectsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectProvider);
    // UI implementation
  }
}
```

### 2. Dependency Injection
```dart
// ✅ DOĞRU DI kullanımı
final getIt = GetIt.instance;

void setupDependencies() {
  // External dependencies
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  
  // Services
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(getIt()),
  );
  
  // Repositories
  getIt.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(getIt(), getIt()),
  );
  
  // Use cases
  getIt.registerLazySingleton<GetProjectsUseCase>(
    () => GetProjectsUseCase(getIt()),
  );
}
```

### 3. Use Case Pattern
```dart
// ✅ DOĞRU use case implementasyonu
class GetProjectsUseCase {
  final ProjectRepository _repository;
  
  GetProjectsUseCase(this._repository);
  
  Future<List<Project>> call() async {
    return await _repository.getProjects();
  }
}

// Parametreli use case
class GetProjectByIdUseCase {
  final ProjectRepository _repository;
  
  GetProjectByIdUseCase(this._repository);
  
  Future<Project> call(String id) async {
    if (id.isEmpty) {
      throw ArgumentError('Project ID cannot be empty');
    }
    
    return await _repository.getProjectById(id);
  }
}
```

## 🎨 UI/UX Standartları

### 1. Layout ve Responsive Design Kuralları

#### Layout Yapısı
```dart
// ✅ DOĞRU Layout kullanımı
class MainLayout extends StatelessWidget {
  final Widget child;
  
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ResponsiveWidget(
        mobile: MobileLayout(child: child),
        tablet: TabletLayout(child: child),
        desktop: DesktopLayout(child: child),
      ),
      bottomNavigationBar: ResponsiveWidget(
        mobile: const MobileBottomNav(),
        tablet: null, // Tablet'te bottom nav yok
        desktop: null, // Desktop'ta bottom nav yok
      ),
    );
  }
}

// ✅ DOĞRU Responsive Layout
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktop ?? tablet ?? mobile;
        } else if (constraints.maxWidth >= 768) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
```

#### Grid Layout Kullanımı
```dart
// ✅ DOĞRU Grid Layout
class ProjectGrid extends StatelessWidget {
  final List<Project> projects;

  const ProjectGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: _buildMobileGrid(),
      tablet: _buildTabletGrid(),
      desktop: _buildDesktopGrid(),
    );
  }

  Widget _buildMobileGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(Branding.spacingM),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: Branding.spacingM,
        mainAxisSpacing: Branding.spacingM,
        childAspectRatio: 1.2,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) => ProjectCard(project: projects[index]),
    );
  }

  Widget _buildTabletGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(Branding.spacingL),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Branding.spacingL,
        mainAxisSpacing: Branding.spacingL,
        childAspectRatio: 1.1,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) => ProjectCard(project: projects[index]),
    );
  }

  Widget _buildDesktopGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(Branding.spacingXL),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: Branding.spacingXL,
        mainAxisSpacing: Branding.spacingXL,
        childAspectRatio: 1.0,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) => ProjectCard(project: projects[index]),
    );
  }
}
```

#### Flex Layout Kullanımı
```dart
// ✅ DOĞRU Flex Layout
class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      child: ResponsiveWidget(
        mobile: _buildMobileHero(),
        tablet: _buildTabletHero(),
        desktop: _buildDesktopHero(),
      ),
    );
  }

  Widget _buildMobileHero() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTitle(fontSize: 32),
        const SizedBox(height: Branding.spacingM),
        _buildSubtitle(fontSize: 16),
        const SizedBox(height: Branding.spacingL),
        _buildCTAButton(),
      ],
    );
  }

  Widget _buildTabletHero() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(fontSize: 48),
              const SizedBox(height: Branding.spacingM),
              _buildSubtitle(fontSize: 18),
              const SizedBox(height: Branding.spacingXL),
              _buildCTAButton(),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: _buildHeroImage(),
        ),
      ],
    );
  }

  Widget _buildDesktopHero() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(fontSize: 64),
              const SizedBox(height: Branding.spacingL),
              _buildSubtitle(fontSize: 20),
              const SizedBox(height: Branding.spacingXXL),
              _buildCTAButton(),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: _buildHeroImage(),
        ),
      ],
    );
  }
}
```

#### Container ve Padding Kullanımı
```dart
// ✅ DOĞRU Container ve Padding
class ContentSection extends StatelessWidget {
  final Widget child;
  
  const ContentSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.responsiveValue(
          context,
          mobile: Branding.spacingM,
          tablet: Branding.spacingL,
          desktop: Branding.spacingXL,
        ),
        vertical: Responsive.responsiveValue(
          context,
          mobile: Branding.spacingL,
          tablet: Branding.spacingXL,
          desktop: Branding.spacingXXL,
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: Responsive.isDesktop(context) ? 1200 : double.infinity,
        ),
        child: child,
      ),
    );
  }
}
```

#### Stack Layout Kullanımı
```dart
// ✅ DOĞRU Stack Layout
class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Stack(
        children: [
          // Background
          _buildBackground(),
          
          // Content
          Positioned.fill(
            child: ResponsiveWidget(
              mobile: _buildMobileContent(),
              tablet: _buildTabletContent(),
              desktop: _buildDesktopContent(),
            ),
          ),
          
          // Floating elements
          _buildFloatingElements(),
        ],
      ),
    );
  }

  Widget _buildMobileContent() {
    return Padding(
      padding: const EdgeInsets.all(Branding.spacingM),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(),
          _buildSubtitle(),
          _buildCTAButton(),
        ],
      ),
    );
  }
}
```

### 2. Responsive Design Kuralları

#### Breakpoint Sistemi
```dart
// ✅ DOĞRU Breakpoint kullanımı
class Responsive {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }
  
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 768 && width < 1200;
  }
  
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }
  
  static T responsiveValue<T>(
    BuildContext context, {
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet;
    return mobile;
  }
  
  static double responsiveFontSize(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    return responsiveValue(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}
```

#### Responsive Widget Kullanımı
```dart
// ✅ DOĞRU Responsive Widget kullanımı
class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktop ?? tablet ?? mobile;
        } else if (constraints.maxWidth >= 768) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}

// Kullanım
ResponsiveWidget(
  mobile: MobileLayout(),
  tablet: TabletLayout(),
  desktop: DesktopLayout(),
)
```

#### Responsive Spacing
```dart
// ✅ DOĞRU Responsive Spacing
class ResponsiveSpacing {
  static EdgeInsets responsivePadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: Responsive.responsiveValue(
        context,
        mobile: Branding.spacingM,
        tablet: Branding.spacingL,
        desktop: Branding.spacingXL,
      ),
      vertical: Responsive.responsiveValue(
        context,
        mobile: Branding.spacingS,
        tablet: Branding.spacingM,
        desktop: Branding.spacingL,
      ),
    );
  }
  
  static double responsiveSpacing(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    return Responsive.responsiveValue(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}
```

#### Responsive Typography
```dart
// ✅ DOĞRU Responsive Typography
class ResponsiveTypography {
  static TextStyle responsiveTextStyle(
    BuildContext context, {
    required TextStyle baseStyle,
    required double mobileFontSize,
    required double tabletFontSize,
    required double desktopFontSize,
  }) {
    final fontSize = Responsive.responsiveFontSize(
      context,
      mobile: mobileFontSize,
      tablet: tabletFontSize,
      desktop: desktopFontSize,
    );
    
    return baseStyle.copyWith(fontSize: fontSize);
  }
}

// Kullanım
Text(
  'Başlık',
  style: ResponsiveTypography.responsiveTextStyle(
    context,
    baseStyle: AppTypography.h1,
    mobileFontSize: 24,
    tabletFontSize: 32,
    desktopFontSize: 48,
  ),
)
```

### 3. Layout Best Practices

#### Container Kullanımı
```dart
// ✅ DOĞRU Container kullanımı
Container(
  width: double.infinity,
  padding: ResponsiveSpacing.responsivePadding(context),
  decoration: BoxDecoration(
    color: Branding.backgroundPrimary,
    borderRadius: BorderRadius.circular(Branding.radiusM),
    boxShadow: [
      BoxShadow(
        color: Branding.darkGrey.withValues(alpha: 0.1),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  child: child,
)

// ❌ YANLIŞ - Hardcoded değerler
Container(
  width: 300,
  padding: EdgeInsets.all(16),
  color: Colors.white,
  child: child,
)
```

#### Column ve Row Kullanımı
```dart
// ✅ DOĞRU Column/Row kullanımı
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    _buildTitle(),
    SizedBox(height: ResponsiveSpacing.responsiveSpacing(
      context,
      mobile: Branding.spacingS,
      tablet: Branding.spacingM,
      desktop: Branding.spacingL,
    )),
    _buildSubtitle(),
  ],
)

// ✅ DOĞRU Row kullanımı
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(child: _buildLeftContent()),
    SizedBox(width: ResponsiveSpacing.responsiveSpacing(
      context,
      mobile: Branding.spacingM,
      tablet: Branding.spacingL,
      desktop: Branding.spacingXL,
    )),
    Expanded(child: _buildRightContent()),
  ],
)
```

#### Expanded ve Flexible Kullanımı
```dart
// ✅ DOĞRU Expanded kullanımı
Row(
  children: [
    Expanded(
      flex: 2,
      child: _buildMainContent(),
    ),
    Expanded(
      flex: 1,
      child: _buildSidebar(),
    ),
  ],
)

// ✅ DOĞRU Flexible kullanımı
Row(
  children: [
    Flexible(
      flex: 2,
      child: _buildMainContent(),
    ),
    Flexible(
      flex: 1,
      child: _buildSidebar(),
    ),
  ],
)
```

### 4. Renk Paleti (ASLA DEĞİŞTİRME)
```dart
// lib/core/theme/branding.dart
class Branding {
  // Ana renkler - ASLA değiştirme
  static const Color primaryColor = Color(0xFF0B132B); // Navy Blue
  static const Color accentColor = Color(0xFFB8B8B8); // Platinum
  static const Color textPrimary = Color(0xFFFFFFFF); // White
  static const Color textSecondary = Color(0xFFB0BEC5); // Light Grey
  
  // Spacing - ASLA değiştirme
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
}
```

### 2. Typography
```dart
// ✅ DOĞRU typography kullanımı
Text(
  'Başlık',
  style: AppTypography.h1.copyWith(
    color: Branding.textPrimary,
    fontSize: Responsive.responsiveFontSize(
      context,
      desktop: 32,
      tablet: 28,
      mobile: 24,
    ),
  ),
)

// ❌ YANLIŞ - Hardcoded style
Text(
  'Başlık',
  style: TextStyle(
    fontSize: 24,
    color: Colors.black,
  ),
)
```

### 3. Responsive Design
```dart
// ✅ DOĞRU responsive kullanımı
Container(
  padding: EdgeInsets.symmetric(
    horizontal: Responsive.responsiveValue(
      context,
      mobile: Branding.spacingM,
      tablet: Branding.spacingL,
      desktop: Branding.spacingXL,
    ),
  ),
  child: Text(
    'İçerik',
    style: AppTypography.bodyLarge.copyWith(
      fontSize: Responsive.responsiveFontSize(
        context,
        desktop: 18,
        tablet: 16,
        mobile: 14,
      ),
    ),
  ),
)
```

## 🚨 Error Handling

### 1. Try-Catch Kullanımı
```dart
// ✅ DOĞRU error handling
Future<List<Project>> loadProjects() async {
  try {
    final projects = await _apiService.getProjects();
    return projects.map((json) => ProjectModel.fromJson(json)).toList();
  } on SocketException {
    throw NetworkException('No internet connection');
  } on TimeoutException {
    throw TimeoutException('Request timed out');
  } on HttpException catch (e) {
    throw ApiException('HTTP error: ${e.message}');
  } catch (e) {
    throw UnknownException('Unexpected error: $e');
  }
}

// ❌ YANLIŞ - Error handling yok
Future<List<Project>> loadProjects() async {
  final projects = await _apiService.getProjects();
  return projects.map((json) => ProjectModel.fromJson(json)).toList();
}
```

### 2. Error States
```dart
// ✅ DOĞRU error state handling
class ProjectNotifier extends StateNotifier<ProjectState> {
  Future<void> loadProjects() async {
    state = const ProjectState.loading();
    try {
      final projects = await _getProjectsUseCase();
      state = ProjectState.loaded(projects);
    } catch (e) {
      state = ProjectState.error(e.toString());
    }
  }
}

// Widget'da error handling
projectState.when(
  initial: () => const EmptyState(),
  loading: () => const LoadingWidget(),
  loaded: (projects) => ProjectGrid(projects: projects),
  error: (message) => ErrorWidget(message: message),
)
```

### 3. Validation
```dart
// ✅ DOĞRU validation
class Project {
  final String id;
  final String title;
  final String description;

  const Project({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null || json['title'] == null) {
      throw ValidationException('Required fields are missing');
    }
    
    return Project(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
    );
  }
}
```

## 🧪 Testing Kuralları

### 1. Unit Test
```dart
// test/domain/usecases/get_projects_test.dart
void main() {
  group('GetProjectsUseCase', () {
    late GetProjectsUseCase useCase;
    late MockProjectRepository mockRepository;
    
    setUp(() {
      mockRepository = MockProjectRepository();
      useCase = GetProjectsUseCase(mockRepository);
    });
    
    test('should return projects when repository call is successful', () async {
      // Arrange
      final projects = [
        Project(id: '1', title: 'Test Project 1'),
        Project(id: '2', title: 'Test Project 2'),
      ];
      when(mockRepository.getProjects()).thenAnswer((_) async => projects);
      
      // Act
      final result = await useCase();
      
      // Assert
      expect(result, equals(projects));
      verify(mockRepository.getProjects()).called(1);
    });
  });
}
```

### 2. Widget Test
```dart
// test/presentation/widgets/project_card_test.dart
void main() {
  group('ProjectCard', () {
    late Project testProject;
    
    setUp(() {
      testProject = Project(
        id: '1',
        title: 'Test Project',
        description: 'Test Description',
      );
    });
    
    testWidgets('displays project information correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProjectCard(project: testProject),
          ),
        ),
      );
      
      expect(find.text('Test Project'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
    });
  });
}
```

## 🔧 Git Workflow

### 1. Commit Message Formatı
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

#### Commit Tipleri
- **feat**: Yeni özellik
- **fix**: Hata düzeltmesi
- **docs**: Dokümantasyon değişikliği
- **style**: Kod formatlaması
- **refactor**: Kod yeniden düzenleme
- **test**: Test ekleme/düzeltme
- **chore**: Build süreçleri, araçlar

#### Örnek Commit Mesajları
```
feat(home): add hero section with animations
fix(api): resolve timeout issue in project service
docs(readme): update installation instructions
style(theme): improve color contrast for accessibility
refactor(project): extract common widget components
test(project): add unit tests for project repository
chore(deps): update flutter to version 3.16.0
```

### 2. Branch Naming
```
feature/description
bugfix/description
hotfix/description
release/version
chore/description
```

## 🐛 Debugging Rehberi

### 1. Yaygın Hatalar ve Çözümleri

#### Riverpod Provider Hatası
```dart
// ❌ HATA: Provider not found
final projectProvider = Provider<ProjectNotifier>((ref) => ProjectNotifier());

// ✅ ÇÖZÜM: StateNotifierProvider kullan
final projectProvider = StateNotifierProvider<ProjectNotifier, ProjectState>(
  (ref) => ProjectNotifier(getIt()),
);
```

#### Context Hatası
```dart
// ❌ HATA: Context kullanımı
Widget build(BuildContext context) {
  final projects = ref.watch(projectProvider); // ref yok
}

// ✅ ÇÖZÜM: ConsumerWidget kullan
class ProjectsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectProvider);
    // ...
  }
}
```

#### Navigation Hatası
```dart
// ❌ HATA: Eski navigation
Navigator.push(context, MaterialPageRoute(builder: (context) => Page()));

// ✅ ÇÖZÜM: Auto Route kullan
context.router.push(ProjectRoute(projectId: project.id));
```

### 2. Performance Debugging
```dart
// ✅ DOĞRU performance debugging
class ProjectCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CachedNetworkImage( // Image caching
        imageUrl: project.thumbnail,
        memCacheWidth: 300, // Memory optimization
        memCacheHeight: 200,
      ),
    );
  }
}
```

### 3. Memory Leak Prevention
```dart
// ✅ DOĞRU memory management
class ProjectCard extends StatefulWidget {
  @override
  void dispose() {
    _animationController.dispose(); // Controller'ları temizle
    _scrollController.dispose();
    super.dispose();
  }
}
```

## 📋 Checklist - Her Değişiklik Öncesi

### ✅ Kod Yazım Öncesi
- [ ] Clean Architecture katmanlarına uygun mu?
- [ ] Riverpod kullanıyor mu?
- [ ] Responsive design uygulanmış mı?
- [ ] Error handling var mı?
- [ ] Branding renklerini kullanıyor mu?

### ✅ Widget Oluştururken
- [ ] ConsumerWidget extends ediyor mu?
- [ ] Required parametreler var mı?
- [ ] Private metodlar alt çizgi ile başlıyor mu?
- [ ] Responsive değerler kullanıyor mu?

### ✅ State Management
- [ ] StateNotifierProvider kullanıyor mu?
- [ ] Freezed ile state tanımlanmış mı?
- [ ] Error state'leri var mı?
- [ ] Loading state'leri var mı?

### ✅ API Integration
- [ ] Repository pattern kullanıyor mu?
- [ ] Use case pattern kullanıyor mu?
- [ ] Error handling var mı?
- [ ] Loading state'leri var mı?

### ✅ UI/UX
- [ ] Branding renklerini kullanıyor mu?
- [ ] Responsive design uygulanmış mı?
- [ ] Typography standartlarını kullanıyor mu?
- [ ] Spacing standartlarını kullanıyor mu?
- [ ] Layout kurallarına uygun mu?
- [ ] ResponsiveWidget kullanıyor mu?
- [ ] Breakpoint sistemi doğru mu?
- [ ] Container/Column/Row kullanımı doğru mu?

## 🚫 YAPILMAMASI GEREKENLER

### ❌ ASLA YAPMA
- Mevcut mimariyi bozma
- Renk paletini değiştirme
- Clean Architecture katmanlarını karıştırma
- Hardcoded değerler kullanma
- Error handling'i atlama
- Responsive design'ı ihmal etme
- State management'i yanlış kullanma
- Git standartlarını ihlal etme
- **Linter hatalarını görmezden gelme**
- **İşlemi yarım bırakma**
- **Hataları çözmeden işlemi tamamlama**

### 🔧 HATA YÖNETİMİ KURALLARI
1. **Linter Kontrolü**: Her işlem sonrası `read_lints` çalıştır
2. **Hata Sayısı**: 0 hata olana kadar devam et
3. **Kritik Hatalar**: Error seviyesindeki hataları öncelikle çöz
4. **Warning'ler**: Warning'leri de çöz, görmezden gelme
5. **TODO Listesi**: Büyük işlemlerde TODO listesi oluştur
6. **Hata Raporu**: Kalan hataları detaylı açıkla
7. **İşlem Durumu**: Hatalar varsa işlemi "tamamlandı" olarak işaretleme
8. **Hata Çözme**: Hataları çözemiyorsan kullanıcıya danış
9. **Döngü Önleme**: Aynı işlemi 3 kez tekrarlama
10. **Durum Raporu**: Kalan hataları detaylı açıkla

### ❌ YANLIŞ ÖRNEKLER
```dart
// ❌ YANLIŞ - Hardcoded değerler
Container(
  padding: EdgeInsets.all(16),
  color: Colors.blue,
  child: Text('Hello', style: TextStyle(fontSize: 20)),
)

// ❌ YANLIŞ - State management yok
class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getProjects(),
      builder: (context, snapshot) {
        // ...
      },
    );
  }
}

// ❌ YANLIŞ - Error handling yok
Future<List<Project>> getProjects() async {
  final response = await http.get(Uri.parse('$baseUrl/projects'));
  return Project.fromJsonList(json.decode(response.body));
}

// ❌ YANLIŞ - Layout kuralları ihlal edilmiş
Container(
  width: 300, // Hardcoded width
  padding: EdgeInsets.all(16), // Hardcoded padding
  child: Column(
    children: [
      Text('Title', style: TextStyle(fontSize: 20)), // Hardcoded style
      SizedBox(height: 10), // Hardcoded spacing
    ],
  ),
)

// ❌ YANLIŞ - Responsive design yok
Widget build(BuildContext context) {
  return Container(
    width: 400, // Sabit genişlik
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Sabit column sayısı
      ),
      itemBuilder: (context, index) => ProjectCard(),
    ),
  );
}
```

## ✅ DOĞRU ÖRNEKLER

### ✅ Doğru Widget Yapısı
```dart
class ProjectCard extends ConsumerWidget {
  final Project project;
  final VoidCallback? onTap;
  final bool isLoading;

  const ProjectCard({
    super.key,
    required this.project,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: isLoading ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.all(Branding.spacingM),
          child: Column(
            children: [
              _buildImage(),
              const SizedBox(height: Branding.spacingS),
              _buildTitle(),
              const SizedBox(height: Branding.spacingXS),
              _buildDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Branding.radiusM),
      child: CachedNetworkImage(
        imageUrl: project.thumbnail,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
        memCacheWidth: 300,
        memCacheHeight: 200,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      project.title,
      style: AppTypography.h6.copyWith(
        color: Branding.textPrimary,
        fontSize: Responsive.responsiveFontSize(
          context,
          desktop: 18,
          tablet: 16,
          mobile: 14,
        ),
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription() {
    return Text(
      project.description,
      style: AppTypography.bodyMedium.copyWith(
        color: Branding.textSecondary,
        fontSize: Responsive.responsiveFontSize(
          context,
          desktop: 14,
          tablet: 13,
          mobile: 12,
        ),
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
```

### ✅ Doğru State Management
```dart
final projectProvider = StateNotifierProvider<ProjectNotifier, ProjectState>(
  (ref) => ProjectNotifier(getIt()),
);

class ProjectNotifier extends StateNotifier<ProjectState> {
  final GetProjectsUseCase _getProjectsUseCase;
  
  ProjectNotifier(this._getProjectsUseCase) : super(const ProjectState.initial());

  Future<void> loadProjects() async {
    state = const ProjectState.loading();
    try {
      final projects = await _getProjectsUseCase();
      state = ProjectState.loaded(projects);
    } catch (e) {
      state = ProjectState.error(e.toString());
    }
  }

  void refresh() {
    loadProjects();
  }
}

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = _Initial;
  const factory ProjectState.loading() = _Loading;
  const factory ProjectState.loaded(List<Project> projects) = _Loaded;
  const factory ProjectState.error(String message) = _Error;
}
```

### ✅ Doğru Error Handling
```dart
class ApiService {
  Future<List<Project>> getProjects() async {
    try {
      final response = await _httpClient.get('/projects');
      
      if (response.statusCode == 200) {
        return Project.fromJsonList(response.data);
      } else {
        throw ApiException('Failed to load projects: ${response.statusCode}');
      }
    } on SocketException {
      throw NetworkException('No internet connection');
    } on TimeoutException {
      throw TimeoutException('Request timed out');
    } catch (e) {
      throw UnknownException('Unexpected error: $e');
    }
  }
}
```

### ✅ Doğru Layout ve Responsive Design
```dart
class ProjectGrid extends StatelessWidget {
  final List<Project> projects;

  const ProjectGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: _buildMobileGrid(),
      tablet: _buildTabletGrid(),
      desktop: _buildDesktopGrid(),
    );
  }

  Widget _buildMobileGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(Branding.spacingM),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: Branding.spacingM,
        mainAxisSpacing: Branding.spacingM,
        childAspectRatio: 1.2,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) => ProjectCard(project: projects[index]),
    );
  }

  Widget _buildTabletGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(Branding.spacingL),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Branding.spacingL,
        mainAxisSpacing: Branding.spacingL,
        childAspectRatio: 1.1,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) => ProjectCard(project: projects[index]),
    );
  }

  Widget _buildDesktopGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(Branding.spacingXL),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: Branding.spacingXL,
        mainAxisSpacing: Branding.spacingXL,
        childAspectRatio: 1.0,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) => ProjectCard(project: projects[index]),
    );
  }
}

// ✅ Doğru Responsive Container
class ContentSection extends StatelessWidget {
  final Widget child;
  
  const ContentSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.responsiveValue(
          context,
          mobile: Branding.spacingM,
          tablet: Branding.spacingL,
          desktop: Branding.spacingXL,
        ),
        vertical: Responsive.responsiveValue(
          context,
          mobile: Branding.spacingL,
          tablet: Branding.spacingXL,
          desktop: Branding.spacingXXL,
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: Responsive.isDesktop(context) ? 1200 : double.infinity,
        ),
        child: child,
      ),
    );
  }
}

// ✅ Doğru Responsive Typography
Text(
  'Başlık',
  style: AppTypography.h1.copyWith(
    fontSize: Responsive.responsiveFontSize(
      context,
      desktop: 48,
      tablet: 36,
      mobile: 28,
    ),
    color: Branding.textPrimary,
  ),
)
```

---

**Son Güncelleme**: 2024
**Versiyon**: 1.0.0
**Geliştirici**: Ajans Hoş İşler Team

**Not**: Bu dokümantasyon, AI ajanlarının projede çalışırken izlemesi gereken tüm kuralları ve standartları içerir. Her değişiklik öncesi bu rehberi okuyup kurallara uygun hareket edin.


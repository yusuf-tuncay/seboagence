# 📝 Ajans Hoş İşler - Kod Standartları

Bu dokümantasyon, Ajans Hoş İşler Flutter uygulaması için kod yazım kuralları, best practices ve standartları detaylı bir şekilde açıklar.

## 📋 İçindekiler
- [Genel Prensipler](#genel-prensipler)
- [Dart Kod Standartları](#dart-kod-standartları)
- [Flutter Widget Standartları](#flutter-widget-standartları)
- [Architecture Standartları](#architecture-standartları)
- [Naming Conventions](#naming-conventions)
- [Documentation Standartları](#documentation-standartları)
- [Testing Standartları](#testing-standartları)
- [Git Standartları](#git-standartları)

## 🎯 Genel Prensipler

### 1. Clean Code Prensipleri
- **Readability**: Kod okunabilirliği öncelikli
- **Maintainability**: Sürdürülebilirlik
- **Testability**: Test edilebilirlik
- **Performance**: Performans optimizasyonu
- **Security**: Güvenlik standartları

### 2. SOLID Prensipleri
- **S** - Single Responsibility Principle
- **O** - Open/Closed Principle
- **L** - Liskov Substitution Principle
- **I** - Interface Segregation Principle
- **D** - Dependency Inversion Principle

### 3. DRY Prensipleri
- **Don't Repeat Yourself**: Kendini tekrar etme
- **Code Reusability**: Kod yeniden kullanılabilirliği
- **Abstraction**: Soyutlama seviyeleri

## 🎨 Dart Kod Standartları

### 1. Kod Formatlaması
```dart
// ✅ Doğru formatlama
class UserService {
  final ApiClient _apiClient;
  final CacheService _cacheService;

  const UserService({
    required ApiClient apiClient,
    required CacheService cacheService,
  })  : _apiClient = apiClient,
        _cacheService = cacheService;

  Future<User> getUserById(String id) async {
    try {
      final cachedUser = await _cacheService.getUser(id);
      if (cachedUser != null) {
        return cachedUser;
      }

      final user = await _apiClient.getUser(id);
      await _cacheService.saveUser(user);
      return user;
    } catch (e) {
      throw UserException('Failed to get user: $e');
    }
  }
}

// ❌ Yanlış formatlama
class UserService{
final ApiClient _apiClient;
final CacheService _cacheService;
const UserService({required ApiClient apiClient,required CacheService cacheService}):_apiClient=apiClient,_cacheService=cacheService;
Future<User> getUserById(String id) async{
try{
final cachedUser=await _cacheService.getUser(id);
if(cachedUser!=null){return cachedUser;}
final user=await _apiClient.getUser(id);
await _cacheService.saveUser(user);
return user;
}catch(e){throw UserException('Failed to get user: $e');}
}
}
```

### 2. Import Sıralaması
```dart
// ✅ Doğru import sıralaması
// 1. Dart core libraries
import 'dart:async';
import 'dart:io';

// 2. Flutter libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 3. Third-party packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

// 4. Internal imports (relative paths)
import '../core/constants/app_constants.dart';
import '../domain/entities/user.dart';
import '../data/models/user_model.dart';
```

### 3. Null Safety Kullanımı
```dart
// ✅ Doğru null safety kullanımı
class User {
  final String id;
  final String name;
  final String? email;
  final DateTime? lastLogin;

  const User({
    required this.id,
    required this.name,
    this.email,
    this.lastLogin,
  });

  // Null-safe getter
  String get displayName => name;
  
  // Null-safe method
  bool get hasEmail => email != null;
  
  // Null-safe operator
  String get emailOrEmpty => email ?? '';
}

// ❌ Yanlış null safety kullanımı
class User {
  final String id;
  final String name;
  final String email; // Nullable olmalı
  final DateTime lastLogin; // Nullable olmalı
}
```

### 4. Error Handling
```dart
// ✅ Doğru error handling
class ApiService {
  Future<User> getUser(String id) async {
    try {
      final response = await _httpClient.get('/users/$id');
      
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw ApiException('Failed to get user: ${response.statusCode}');
      }
    } on SocketException {
      throw NetworkException('No internet connection');
    } on TimeoutException {
      throw TimeoutException('Request timed out');
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }
}

// ❌ Yanlış error handling
Future<User> getUser(String id) async {
  final response = await _httpClient.get('/users/$id');
  return User.fromJson(response.data); // Error handling yok
}
```

## 🎨 Flutter Widget Standartları

### 1. Widget Yapısı
```dart
// ✅ Doğru widget yapısı
class ProjectCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              const SizedBox(height: 12),
              _buildTitle(),
              const SizedBox(height: 8),
              _buildDescription(),
              if (isLoading) ...[
                const SizedBox(height: 12),
                _buildLoadingIndicator(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        project.thumbnail,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      project.title,
      style: Theme.of(context).textTheme.headlineSmall,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription() {
    return Text(
      project.description,
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
```

### 2. State Management (Riverpod)
```dart
// ✅ Doğru Riverpod kullanımı
// Provider tanımı
final projectProvider = StateNotifierProvider<ProjectNotifier, ProjectState>(
  (ref) => ProjectNotifier(getIt()),
);

// StateNotifier implementasyonu
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
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectProvider);
    
    return Scaffold(
      body: projectState.when(
        initial: () => const EmptyState(),
        loading: () => const LoadingWidget(),
        loaded: (projects) => ProjectGrid(projects: projects),
        error: (message) => ErrorWidget(message: message),
      ),
    );
  }
}
```

### 3. Responsive Design
```dart
// ✅ Doğru responsive design
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

## 🏗️ Architecture Standartları

### 1. Clean Architecture Katmanları
```dart
// ✅ Doğru katman ayrımı
// Domain Layer
abstract class ProjectRepository {
  Future<List<Project>> getProjects();
  Future<Project> getProjectById(String id);
}

// Data Layer
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

// Presentation Layer
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
// ✅ Doğru DI kullanımı
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
// ✅ Doğru use case implementasyonu
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

## 📝 Naming Conventions

### 1. Dosya İsimlendirme
```
// ✅ Doğru dosya isimlendirme
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   ├── di/
│   │   └── injection.dart
│   └── theme/
│       └── app_theme.dart
├── data/
│   ├── models/
│   │   └── project_model.dart
│   └── repositories/
│       └── project_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── project.dart
│   └── usecases/
│       └── get_projects.dart
└── presentation/
    ├── pages/
    │   └── projects_page.dart
    └── widgets/
        └── project_card.dart
```

### 2. Sınıf İsimlendirme
```dart
// ✅ Doğru sınıf isimlendirme
class ProjectCard extends StatelessWidget {}
class ProjectRepositoryImpl implements ProjectRepository {}
class GetProjectsUseCase {}
class ProjectState {}
class ApiService {}
class UserModel {}
```

### 3. Değişken İsimlendirme
```dart
// ✅ Doğru değişken isimlendirme
class ProjectCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 768;
    
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
```

### 4. Sabit İsimlendirme
```dart
// ✅ Doğru sabit isimlendirme
class AppConstants {
  static const String appName = 'Ajans Hoş İşler';
  static const String apiBaseUrl = 'https://api.seboagency.com';
  static const int maxRetryAttempts = 3;
  static const Duration requestTimeout = Duration(seconds: 30);
}

class Branding {
  static const Color primaryColor = Color(0xFF0B132B);
  static const Color accentColor = Color(0xFFB8B8B8);
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
}
```

## 📚 Documentation Standartları

### 1. Sınıf Dokümantasyonu
```dart
/// 🎨 ProjectCard - Proje kartı widget'ı
/// 
/// Bu widget, proje bilgilerini kart formatında gösterir.
/// Kullanıcı etkileşimleri için onTap callback'i destekler.
/// 
/// Örnek kullanım:
/// ```dart
/// ProjectCard(
///   project: Project(id: '1', title: 'Test Project'),
///   onTap: () => Navigator.pushNamed(context, '/project/1'),
/// )
/// ```
class ProjectCard extends StatelessWidget {
  /// Gösterilecek proje bilgisi
  final Project project;
  
  /// Kart tıklandığında çalışacak callback
  final VoidCallback? onTap;
  
  /// Yükleme durumu gösterilip gösterilmeyeceği
  final bool isLoading;

  const ProjectCard({
    super.key,
    required this.project,
    this.onTap,
    this.isLoading = false,
  });
}
```

### 2. Metod Dokümantasyonu
```dart
/// Projeleri yükler ve state'i günceller
/// 
/// Bu metod, projeleri API'den yükler ve başarılı olursa
/// state'i loaded olarak günceller. Hata durumunda
/// state'i error olarak günceller.
/// 
/// Örnek kullanım:
/// ```dart
/// await projectNotifier.loadProjects();
/// ```
Future<void> loadProjects() async {
  state = const ProjectState.loading();
  
  try {
    final projects = await _getProjectsUseCase();
    state = ProjectState.loaded(projects);
  } catch (e) {
    state = ProjectState.error(e.toString());
  }
}
```

### 3. README Dokümantasyonu
```markdown
# 📱 ProjectCard Widget

Proje bilgilerini kart formatında gösteren widget.

## 🎯 Özellikler

- Proje bilgilerini görsel olarak gösterir
- Tıklanabilir kart desteği
- Yükleme durumu göstergesi
- Responsive tasarım

## 📋 Kullanım

```dart
ProjectCard(
  project: Project(
    id: '1',
    title: 'Test Project',
    description: 'Project description',
  ),
  onTap: () => Navigator.pushNamed(context, '/project/1'),
)
```

## 🎨 Parametreler

| Parametre | Tip | Açıklama |
|-----------|-----|----------|
| project | Project | Gösterilecek proje bilgisi |
| onTap | VoidCallback? | Kart tıklandığında çalışacak callback |
| isLoading | bool | Yükleme durumu gösterilip gösterilmeyeceği |

## 🎨 Örnekler

### Basit Kullanım
```dart
ProjectCard(project: project)
```

### Tıklanabilir Kart
```dart
ProjectCard(
  project: project,
  onTap: () => _navigateToProject(),
)
```

### Yükleme Durumu
```dart
ProjectCard(
  project: project,
  isLoading: true,
)
```
```

## 🧪 Testing Standartları

### 1. Unit Test Standartları
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
    
    group('call', () {
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
      
      test('should throw exception when repository call fails', () async {
        // Arrange
        when(mockRepository.getProjects()).thenThrow(Exception('Network error'));
        
        // Act & Assert
        expect(() => useCase(), throwsException);
      });
    });
  });
}
```

### 2. Widget Test Standartları
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
        category: 'Web',
        images: ['image1.jpg'],
        createdAt: DateTime(2024, 1, 1),
      );
    });
    
    testWidgets('displays project information correctly', (tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProjectCard(project: testProject),
          ),
        ),
      );
      
      // Assert
      expect(find.text('Test Project'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
    });
    
    testWidgets('calls onTap when card is tapped', (tester) async {
      // Arrange
      bool onTapCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProjectCard(
              project: testProject,
              onTap: () => onTapCalled = true,
            ),
          ),
        ),
      );
      
      // Act
      await tester.tap(find.byType(ProjectCard));
      await tester.pump();
      
      // Assert
      expect(onTapCalled, isTrue);
    });
  });
}
```

### 3. Integration Test Standartları
```dart
// integration_test/app_test.dart
void main() {
  group('App Integration Tests', () {
    testWidgets('user can navigate through all pages', (tester) async {
      // Arrange
      await tester.pumpWidget(const AjansHosIslerApp());
      
      // Act & Assert - Home page
      expect(find.text('ŞEBNEM YÜCEER'), findsOneWidget);
      
      // Navigate to About page
      await tester.tap(find.text('Hakkımızda'));
      await tester.pumpAndSettle();
      expect(find.text('Hakkımızda'), findsOneWidget);
      
      // Navigate to Works page
      await tester.tap(find.text('Projeler'));
      await tester.pumpAndSettle();
      expect(find.text('Projelerimiz'), findsOneWidget);
      
      // Navigate to Contact page
      await tester.tap(find.text('İletişim'));
      await tester.pumpAndSettle();
      expect(find.text('İletişim'), findsOneWidget);
    });
  });
}
```

## 🔧 Git Standartları

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

#### Örnek Branch İsimleri
```
feature/home-hero-section
bugfix/project-card-tap-issue
hotfix/critical-api-timeout
release/v1.0.0
chore/update-dependencies
```

### 3. Pull Request Template
```markdown
## 📋 Açıklama
Bu PR'ın amacı ve yaptığı değişiklikler.

## 🎯 Değişiklik Türü
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update
- [ ] Code refactoring

## 🧪 Test Durumu
- [ ] Unit testler eklendi/güncellendi
- [ ] Widget testler eklendi/güncellendi
- [ ] Integration testler eklendi/güncellendi
- [ ] Manuel test yapıldı

## 📸 Ekran Görüntüleri
Eğer UI değişikliği varsa, önce/sonra ekran görüntüleri.

## ✅ Checklist
- [ ] Kod lint kurallarına uygun
- [ ] Dokümantasyon güncellendi
- [ ] Test coverage yeterli
- [ ] Performance etkisi değerlendirildi
- [ ] Breaking change yoksa backward compatibility korundu
```

---

**Son Güncelleme**: 2024
**Versiyon**: 1.0.0
**Geliştirici**: Ajans Hoş İşler Team



# 🏗️ Ajans Hoş İşler - Mimari Rehberi

Bu dokümantasyon, Ajans Hoş İşler Flutter uygulamasının Clean Architecture prensiplerine dayalı mimari yapısını detaylı bir şekilde açıklar.

## 📋 İçindekiler
- [Mimari Genel Bakış](#mimari-genel-bakış)
- [Clean Architecture Katmanları](#clean-architecture-katmanları)
- [Proje Yapısı](#proje-yapısı)
- [Dependency Injection](#dependency-injection)
- [State Management](#state-management)
- [Routing](#routing)
- [Data Flow](#data-flow)
- [Best Practices](#best-practices)

## 🎯 Mimari Genel Bakış

### Mimari Prensipler
- **Separation of Concerns**: Endişelerin ayrılması
- **Dependency Inversion**: Bağımlılık tersine çevirme
- **Single Responsibility**: Tek sorumluluk prensibi
- **Open/Closed Principle**: Açık/kapalı prensibi
- **Interface Segregation**: Arayüz ayrımı

### Mimari Katmanları
```
┌─────────────────────────────────────┐
│           Presentation Layer         │ ← UI/UX, Widgets, Pages
├─────────────────────────────────────┤
│            Domain Layer              │ ← Business Logic, Entities
├─────────────────────────────────────┤
│             Data Layer               │ ← Repositories, Data Sources
└─────────────────────────────────────┘
```

## 🏛️ Clean Architecture Katmanları

### 1. Presentation Layer (Sunum Katmanı)

#### 1.1 Pages (Sayfalar)
```dart
// lib/presentation/pages/home_page.dart
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectProvider);
    
    return Scaffold(
      body: projects.when(
        data: (data) => ProjectGrid(projects: data),
        loading: () => const LoadingWidget(),
        error: (error, stack) => ErrorWidget(error: error),
      ),
    );
  }
}
```

#### 1.2 Widgets (Bileşenler)
```dart
// lib/presentation/widgets/project_card.dart
class ProjectCard extends StatelessWidget {
  final Project project;
  
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(project.thumbnail),
          Text(project.title),
          Text(project.description),
        ],
      ),
    );
  }
}
```

#### 1.3 Layouts (Düzenler)
```dart
// lib/presentation/layouts/main_layout.dart
class MainLayout extends StatelessWidget {
  final Widget child;
  
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: child,
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
```

### 2. Domain Layer (İş Mantığı Katmanı)

#### 2.1 Entities (Varlıklar)
```dart
// lib/domain/entities/project.dart
class Project {
  final String id;
  final String title;
  final String description;
  final String category;
  final List<String> images;
  final DateTime createdAt;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.images,
    required this.createdAt,
  });
}
```

#### 2.2 Use Cases (Kullanım Durumları)
```dart
// lib/domain/usecases/get_projects.dart
class GetProjectsUseCase {
  final ProjectRepository _repository;
  
  GetProjectsUseCase(this._repository);
  
  Future<List<Project>> call() async {
    return await _repository.getProjects();
  }
}
```

#### 2.3 Repository Interfaces (Repository Arayüzleri)
```dart
// lib/domain/repositories/project_repository.dart
abstract class ProjectRepository {
  Future<List<Project>> getProjects();
  Future<Project> getProjectById(String id);
  Future<List<Project>> getProjectsByCategory(String category);
}
```

### 3. Data Layer (Veri Katmanı)

#### 3.1 Data Sources (Veri Kaynakları)
```dart
// lib/data/datasources/api_service.dart
class ApiService {
  final http.Client _client;
  static const String baseUrl = 'https://api.seboagency.com';
  
  ApiService(this._client);
  
  Future<List<Map<String, dynamic>>> getProjects() async {
    final response = await _client.get(
      Uri.parse('$baseUrl/projects'),
      headers: {'Content-Type': 'application/json'},
    );
    
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw ServerException('Failed to load projects');
    }
  }
}
```

#### 3.2 Models (Modeller)
```dart
// lib/data/models/project_model.dart
class ProjectModel extends Project {
  const ProjectModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.images,
    required super.createdAt,
  });
  
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      images: List<String>.from(json['images'] as List),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'images': images,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
```

#### 3.3 Repository Implementations (Repository Uygulamaları)
```dart
// lib/data/repositories/project_repository_impl.dart
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
      // Fallback to local data
      return await _localDataSource.getCachedProjects();
    }
  }
}
```

## 📁 Proje Yapısı

### Core (Temel Sistem)
```
lib/core/
├── constants/          # Sabitler ve konfigürasyonlar
│   ├── app_constants.dart
│   ├── api_constants.dart
│   └── theme_constants.dart
├── di/                 # Dependency Injection
│   ├── injection.dart
│   └── service_locator.dart
├── routing/            # Route yapılandırması
│   ├── app_router.dart
│   └── route_guards.dart
├── services/           # Servisler
│   ├── api_service.dart
│   ├── storage_service.dart
│   └── analytics_service.dart
├── theme/              # Tema sistemi
│   ├── app_theme.dart
│   ├── branding.dart
│   └── typography.dart
├── ui/                 # UI yardımcıları
│   ├── colors.dart
│   ├── dimensions.dart
│   └── animations.dart
└── utils/              # Yardımcı fonksiyonlar
    ├── extensions.dart
    ├── validators.dart
    └── helpers.dart
```

### Data (Veri Katmanı)
```
lib/data/
├── datasources/        # Veri kaynakları
│   ├── remote/
│   │   ├── api_service.dart
│   │   └── api_client.dart
│   └── local/
│       ├── storage_service.dart
│       └── cache_service.dart
├── models/             # Veri modelleri
│   ├── project_model.dart
│   ├── user_model.dart
│   └── api_response.dart
└── repositories/       # Repository uygulamaları
    ├── project_repository_impl.dart
    └── user_repository_impl.dart
```

### Domain (İş Mantığı Katmanı)
```
lib/domain/
├── entities/           # İş nesneleri
│   ├── project.dart
│   ├── user.dart
│   └── conference.dart
├── repositories/       # Repository arayüzleri
│   ├── project_repository.dart
│   └── user_repository.dart
└── usecases/          # İş mantığı use case'leri
    ├── get_projects.dart
    ├── get_project_by_id.dart
    └── create_contact.dart
```

### Features (Özellik Modülleri)
```
lib/features/
├── home/              # Ana sayfa özelliği
│   ├── data/
│   ├── domain/
│   └── presentation/
├── about/             # Hakkımızda özelliği
│   ├── data/
│   ├── domain/
│   └── presentation/
├── works/             # Projeler özelliği
│   ├── data/
│   ├── domain/
│   └── presentation/
└── contact/           # İletişim özelliği
    ├── data/
    ├── domain/
    └── presentation/
```

### Presentation (Sunum Katmanı)
```
lib/presentation/
├── pages/             # Sayfalar
│   ├── home_page.dart
│   ├── about_page.dart
│   ├── works_page.dart
│   └── contact_page.dart
├── widgets/           # Widget'lar
│   ├── common/
│   ├── forms/
│   └── cards/
└── layouts/           # Layout'lar
    ├── main_layout.dart
    └── auth_layout.dart
```

## 🔧 Dependency Injection

### GetIt Konfigürasyonu
```dart
// lib/core/di/injection.dart
final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // External Dependencies
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  
  // Services
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(getIt()),
  );
  getIt.registerLazySingleton<StorageService>(
    () => StorageService(),
  );
  
  // Data Sources
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(getIt()),
  );
  
  // Repositories
  getIt.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(getIt(), getIt()),
  );
  
  // Use Cases
  getIt.registerLazySingleton<GetProjectsUseCase>(
    () => GetProjectsUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetProjectByIdUseCase>(
    () => GetProjectByIdUseCase(getIt()),
  );
}
```

### Service Locator Kullanımı
```dart
// lib/main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const AjansHosIslerApp());
}
```

## 🔄 State Management

### Riverpod Provider'ları
```dart
// lib/core/providers/project_provider.dart
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
}

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = _Initial;
  const factory ProjectState.loading() = _Loading;
  const factory ProjectState.loaded(List<Project> projects) = _Loaded;
  const factory ProjectState.error(String message) = _Error;
}
```

### Provider Kullanımı
```dart
// lib/presentation/pages/works_page.dart
class WorksPage extends ConsumerWidget {
  const WorksPage({super.key});

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

## 🛣️ Routing

### Auto Route Konfigürasyonu
```dart
// lib/core/routing/app_router.dart
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    // Home Routes
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      initial: true,
    ),
    
    // About Routes
    AutoRoute(
      page: AboutRoute.page,
      path: '/about',
    ),
    
    // Works Routes
    AutoRoute(
      page: WorksRoute.page,
      path: '/works',
    ),
    AutoRoute(
      page: ProjectDetailRoute.page,
      path: '/works/:projectId',
    ),
    
    // Contact Routes
    AutoRoute(
      page: ContactRoute.page,
      path: '/contact',
    ),
  ];
}
```

### Route Tanımları
```dart
// lib/presentation/pages/home_page.dart
@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  // ...
}

// lib/presentation/pages/project_detail_page.dart
@RoutePage()
class ProjectDetailPage extends ConsumerWidget {
  const ProjectDetailPage({
    super.key,
    @PathParam('projectId') required this.projectId,
  });
  
  final String projectId;
  // ...
}
```

## 📊 Data Flow

### Veri Akışı Diyagramı
```
User Action → Widget → Provider → Use Case → Repository → Data Source
     ↑                                                           ↓
     └─── State Update ← Provider ← Use Case ← Repository ←──────┘
```

### Örnek Veri Akışı
```dart
// 1. User Action
onPressed: () => ref.read(projectProvider.notifier).loadProjects()

// 2. Provider Action
Future<void> loadProjects() async {
  state = const ProjectState.loading();
  final projects = await _getProjectsUseCase();
  state = ProjectState.loaded(projects);
}

// 3. Use Case Execution
Future<List<Project>> call() async {
  return await _repository.getProjects();
}

// 4. Repository Implementation
Future<List<Project>> getProjects() async {
  final data = await _apiService.getProjects();
  return data.map((json) => ProjectModel.fromJson(json)).toList();
}

// 5. API Service Call
Future<List<Map<String, dynamic>>> getProjects() async {
  final response = await _client.get(Uri.parse('$baseUrl/projects'));
  return List<Map<String, dynamic>>.from(json.decode(response.body));
}
```

## 🎯 Best Practices

### 1. Kod Organizasyonu
- **Feature-based Structure**: Özellik bazlı klasör yapısı
- **Single Responsibility**: Her dosya tek sorumluluğa sahip
- **Consistent Naming**: Tutarlı isimlendirme
- **Clear Separation**: Katmanlar arası net ayrım

### 2. Error Handling
```dart
// lib/core/errors/failures.dart
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
```

### 3. Logging ve Debugging
```dart
// lib/core/utils/logger.dart
class Logger {
  static void info(String message) {
    debugPrint('INFO: $message');
  }
  
  static void error(String message, [dynamic error]) {
    debugPrint('ERROR: $message');
    if (error != null) debugPrint('Error details: $error');
  }
}
```

### 4. Testing Strategy
- **Unit Tests**: Use case'ler ve repository'ler
- **Widget Tests**: UI bileşenleri
- **Integration Tests**: End-to-end kullanıcı akışları
- **Mock Objects**: Test verileri için mock'lar

### 5. Performance Optimization
- **Lazy Loading**: Sayfa bazlı yükleme
- **Image Caching**: Görsel önbellekleme
- **Memory Management**: Bellek yönetimi
- **Code Splitting**: Kod bölümleme

---

**Son Güncelleme**: 2024
**Versiyon**: 1.0.0
**Geliştirici**: Ajans Hoş İşler Team



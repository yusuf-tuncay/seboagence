# 🛠️ Ajans Hoş İşler - Kurulum Rehberi

Bu dokümantasyon, Ajans Hoş İşler Flutter uygulamasının geliştirme ortamının kurulumunu ve yapılandırmasını detaylı bir şekilde açıklar.

## 📋 İçindekiler
- [Sistem Gereksinimleri](#sistem-gereksinimleri)
- [Flutter Kurulumu](#flutter-kurulumu)
- [IDE Konfigürasyonu](#ide-konfigürasyonu)
- [Proje Kurulumu](#proje-kurulumu)
- [Bağımlılık Yönetimi](#bağımlılık-yönetimi)
- [Geliştirme Araçları](#geliştirme-araçları)
- [Troubleshooting](#troubleshooting)

## 💻 Sistem Gereksinimleri

### Minimum Gereksinimler
- **İşletim Sistemi**: Windows 10/11, macOS 10.14+, Ubuntu 18.04+
- **RAM**: 8GB (16GB önerilen)
- **Disk Alanı**: 10GB boş alan
- **İnternet Bağlantısı**: Stabil internet bağlantısı

### Önerilen Sistem
- **İşletim Sistemi**: Windows 11, macOS 13+, Ubuntu 22.04+
- **RAM**: 16GB+
- **Disk Alanı**: 20GB+ SSD
- **İşlemci**: Intel i5/AMD Ryzen 5 veya üzeri

## 🚀 Flutter Kurulumu

### 1. Flutter SDK Kurulumu

#### Windows
```bash
# 1. Flutter SDK'yı indirin
# https://docs.flutter.dev/get-started/install/windows

# 2. ZIP dosyasını çıkarın
# C:\flutter\ dizinine çıkarın

# 3. PATH'e ekleyin
# Sistem Değişkenleri > PATH > C:\flutter\bin

# 4. Kurulumu doğrulayın
flutter doctor
```

#### macOS
```bash
# 1. Homebrew ile kurulum
brew install --cask flutter

# 2. PATH'i güncelleyin
echo 'export PATH="$PATH:/opt/homebrew/bin/flutter/bin"' >> ~/.zshrc
source ~/.zshrc

# 3. Kurulumu doğrulayın
flutter doctor
```

#### Linux (Ubuntu)
```bash
# 1. Gerekli paketleri yükleyin
sudo apt update
sudo apt install curl git unzip xz-utils zip libglu1-mesa

# 2. Flutter SDK'yı indirin
cd ~/development
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.0-stable.tar.xz

# 3. Çıkarın
tar xf flutter_linux_3.16.0-stable.tar.xz

# 4. PATH'e ekleyin
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.bashrc
source ~/.bashrc

# 5. Kurulumu doğrulayın
flutter doctor
```

### 2. Platform Spesifik Kurulumlar

#### Android Geliştirme
```bash
# Android Studio kurulumu
# https://developer.android.com/studio

# Android SDK kurulumu
flutter doctor --android-licenses

# Emulator kurulumu
# Android Studio > AVD Manager > Create Virtual Device
```

#### iOS Geliştirme (macOS)
```bash
# Xcode kurulumu
# App Store'dan Xcode'u indirin

# iOS Simulator kurulumu
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch

# CocoaPods kurulumu
sudo gem install cocoapods
```

#### Web Geliştirme
```bash
# Chrome kurulumu (otomatik)
flutter config --enable-web

# Web geliştirme araçları
flutter doctor --web
```

### 3. Flutter Konfigürasyonu
```bash
# Flutter kanalını ayarlayın
flutter channel stable

# Flutter'ı güncelleyin
flutter upgrade

# Flutter konfigürasyonunu kontrol edin
flutter config

# Geliştirme araçlarını kontrol edin
flutter doctor -v
```

## 🖥️ IDE Konfigürasyonu

### Visual Studio Code (Önerilen)

#### 1. VS Code Kurulumu
```bash
# VS Code'u indirin
# https://code.visualstudio.com/

# Flutter extension'ını yükleyin
# Extensions > Flutter > Install
```

#### 2. Gerekli Extension'lar
```json
{
  "recommendations": [
    "dart-code.dart-code",
    "dart-code.flutter",
    "ms-vscode.vscode-json",
    "bradlc.vscode-tailwindcss",
    "esbenp.prettier-vscode",
    "ms-vscode.vscode-typescript-next"
  ]
}
```

#### 3. VS Code Ayarları
```json
{
  "dart.flutterSdkPath": "/path/to/flutter",
  "dart.lineLength": 80,
  "dart.insertArgumentPlaceholders": false,
  "dart.previewFlutterUiGuides": true,
  "dart.previewFlutterUiGuidesCustomTracking": true,
  "editor.formatOnSave": true,
  "editor.formatOnType": true,
  "editor.rulers": [80],
  "files.trimTrailingWhitespace": true,
  "files.insertFinalNewline": true
}
```

### Android Studio

#### 1. Android Studio Kurulumu
```bash
# Android Studio'yu indirin
# https://developer.android.com/studio

# Flutter plugin'ini yükleyin
# File > Settings > Plugins > Flutter > Install
```

#### 2. Android Studio Ayarları
- **Flutter SDK Path**: Flutter SDK konumunu ayarlayın
- **Dart SDK Path**: Dart SDK konumunu ayarlayın
- **Code Style**: Dart kod stilini yapılandırın

## 📁 Proje Kurulumu

### 1. Repository Klonlama
```bash
# Repository'yi klonlayın
git clone https://github.com/sebo-agency/sebo-agence.git
cd sebo-agence

# Branch'i kontrol edin
git branch -a
git checkout main
```

### 2. Flutter Projesi Oluşturma
```bash
# Yeni Flutter projesi oluşturun
flutter create sebo_agence --org com.sebo.agency

# Proje dizinine gidin
cd sebo_agence

# Flutter'ı başlatın
flutter pub get
```

### 3. Proje Yapısını Oluşturma
```bash
# Core klasörlerini oluşturun
mkdir -p lib/core/{constants,di,routing,services,theme,ui,utils}
mkdir -p lib/data/{datasources,models,repositories}
mkdir -p lib/domain/{entities,repositories,usecases}
mkdir -p lib/features/{home,about,works,contact}/{data,domain,presentation}
mkdir -p lib/presentation/{pages,widgets,layouts}
mkdir -p test/{unit,widget,integration}
mkdir -p docs
```

## 📦 Bağımlılık Yönetimi

### 1. pubspec.yaml Konfigürasyonu
```yaml
name: sebo_agence
description: Ajans Hoş İşler - Creative Agency Flutter App
version: 1.0.0+1

environment:
  sdk: '>=3.2.0 <4.0.0'
  flutter: ">=3.16.0"

dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_riverpod: ^2.4.9
  
  # Routing
  auto_route: ^7.8.4
  
  # Dependency Injection
  get_it: ^7.6.4
  
  # Code Generation
  freezed: ^2.4.6
  json_annotation: ^4.8.1
  
  # HTTP & Networking
  http: ^1.1.0
  dio: ^5.3.2
  
  # UI & Images
  cached_network_image: ^3.3.0
  flutter_svg: ^2.0.9
  shimmer: ^3.0.0
  
  # Local Storage
  shared_preferences: ^2.2.2
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  
  # Utils
  intl: ^0.18.1
  url_launcher: ^6.2.1
  package_info_plus: ^4.2.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  
  # Code Generation
  build_runner: ^2.4.7
  freezed: ^2.4.6
  json_serializable: ^6.7.1
  auto_route_generator: ^7.3.2
  
  # Testing
  mockito: ^5.4.2
  integration_test:
    sdk: flutter
  
  # Linting
  flutter_lints: ^3.0.1
  very_good_analysis: ^5.1.0
```

### 2. Bağımlılıkları Yükleme
```bash
# Bağımlılıkları yükleyin
flutter pub get

# Code generation çalıştırın
flutter packages pub run build_runner build

# Clean build
flutter clean
flutter pub get
```

### 3. Platform Spesifik Konfigürasyonlar

#### Android (android/app/build.gradle)
```gradle
android {
    compileSdkVersion 34
    ndkVersion "25.1.8937393"

    defaultConfig {
        applicationId "com.sebo.agency"
        minSdkVersion 21
        targetSdkVersion 34
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }

    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

#### iOS (ios/Runner/Info.plist)
```xml
<key>CFBundleDisplayName</key>
<string>Ajans Hoş İşler</string>
<key>CFBundleIdentifier</key>
<string>com.sebo.agency</string>
<key>CFBundleVersion</key>
<string>1.0.0</string>
```

## 🔧 Geliştirme Araçları

### 1. Git Konfigürasyonu
```bash
# Git kullanıcı bilgilerini ayarlayın
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Git hooks kurulumu
chmod +x .githooks/pre-commit
git config core.hooksPath .githooks
```

### 2. Pre-commit Hooks
```bash
#!/bin/sh
# .githooks/pre-commit

# Flutter format kontrolü
flutter format --set-exit-if-changed .

# Flutter analyze
flutter analyze

# Test çalıştırma
flutter test
```

### 3. Linting Konfigürasyonu
```yaml
# analysis_options.yaml
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    # Error rules
    avoid_print: true
    avoid_unnecessary_containers: true
    avoid_web_libraries_in_flutter: true
    
    # Style rules
    always_declare_return_types: true
    always_put_control_body_on_new_line: true
    always_specify_types: false
    annotate_overrides: true
    avoid_annotating_with_dynamic: true
    avoid_catches_without_on_clauses: true
    avoid_catching_errors: true
    avoid_double_and_int_checks: true
    avoid_equals_and_hash_code_on_mutable_classes: true
    avoid_escaping_inner_quotes: true
    avoid_field_initializers_in_const_classes: true
    avoid_function_literals_in_foreach_calls: true
    avoid_implementing_value_types: true
    avoid_init_to_null: true
    avoid_js_rounded_ints: true
    avoid_null_checks_in_equality_operators: true
    avoid_positional_boolean_parameters: true
    avoid_private_typedef_functions: true
    avoid_redundant_argument_values: true
    avoid_renaming_method_parameters: true
    avoid_returning_null_for_void: true
    avoid_setters_without_getters: true
    avoid_shadowing_type_parameters: true
    avoid_single_cascade_in_expression_statements: true
    avoid_slow_async_io: true
    avoid_types_as_parameter_names: true
    avoid_unnecessary_type_assertions: true
    avoid_unused_constructor_parameters: true
    avoid_void_async: true
    await_only_futures: true
    camel_case_extensions: true
    camel_case_types: true
    cancel_subscriptions: true
    cascade_invocations: true
    close_sinks: true
    comment_references: true
    constant_identifier_names: true
    control_flow_in_finally: true
    curly_braces_in_flow_control_structures: true
    deprecated_consistency: true
    directives_ordering: true
    empty_catches: true
    empty_constructor_bodies: true
    empty_statements: true
    eol_at_end_of_file: true
    exhaustive_cases: true
    file_names: true
    flutter_style_todos: true
    hash_and_equals: true
    implementation_imports: true
    invariant_booleans: true
    iterable_contains_unrelated_type: true
    join_return_with_assignment: true
    leading_newlines_in_multiline_strings: true
    library_names: true
    library_prefixes: true
    library_private_types_in_public_api: true
    lines_longer_than_80_chars: true
    list_remove_unrelated_type: true
    literal_only_boolean_expressions: true
    missing_whitespace_between_adjacent_strings: true
    no_adjacent_strings_in_list: true
    no_duplicate_case_values: true
    no_logic_in_create_state: true
    non_constant_identifier_names: true
    null_check_on_nullable_type_parameter: true
    null_closures: true
    omit_local_variable_types: true
    one_member_abstracts: true
    only_throw_errors: true
    overridden_fields: true
    package_api_docs: true
    package_names: true
    package_prefixed_library_names: true
    parameter_assignments: true
    prefer_adjacent_string_concatenation: true
    prefer_asserts_in_initializer_lists: true
    prefer_asserts_with_message: true
    prefer_collection_literals: true
    prefer_conditional_assignment: true
    prefer_const_constructors: true
    prefer_const_constructors_in_immutables: true
    prefer_const_declarations: true
    prefer_const_literals_to_create_immutables: true
    prefer_constructors_over_static_methods: true
    prefer_contains: true
    prefer_expression_function_bodies: true
    prefer_final_fields: true
    prefer_final_in_for_each: true
    prefer_final_locals: true
    prefer_for_elements_to_map_fromIterable: true
    prefer_function_declarations_over_variables: true
    prefer_generic_function_type_aliases: true
    prefer_if_elements_to_conditional_expressions: true
    prefer_if_null_operators: true
    prefer_initializing_formals: true
    prefer_inlined_adds: true
    prefer_int_literals: true
    prefer_interpolation_to_compose_strings: true
    prefer_is_empty: true
    prefer_is_not_empty: true
    prefer_is_not_operator: true
    prefer_iterable_whereType: true
    prefer_null_aware_operators: true
    prefer_relative_imports: true
    prefer_single_quotes: true
    prefer_spread_collections: true
    prefer_typing_uninitialized_variables: true
    provide_deprecation_message: true
    public_member_api_docs: true
    recursive_getters: true
    require_trailing_commas: true
    sized_box_for_whitespace: true
    slash_for_doc_comments: true
    sort_child_properties_last: true
    sort_constructors_first: true
    sort_pub_dependencies: true
    sort_unnamed_constructors_first: true
    test_types_in_equals: true
    throw_in_finally: true
    tighten_type_of_initializing_formals: true
    type_annotate_public_apis: true
    type_init_formals: true
    unawaited_futures: true
    unnecessary_await_in_return: true
    unnecessary_brace_in_string_interps: true
    unnecessary_const: true
    unnecessary_constructor_name: true
    unnecessary_getters_setters: true
    unnecessary_lambdas: true
    unnecessary_new: true
    unnecessary_null_aware_assignments: true
    unnecessary_null_checks: true
    unnecessary_null_in_if_null_operators: true
    unnecessary_nullable_for_final_variable_declarations: true
    unnecessary_overrides: true
    unnecessary_parenthesis: true
    unnecessary_raw_strings: true
    unnecessary_string_escapes: true
    unnecessary_string_interpolations: true
    unnecessary_this: true
    unrelated_type_equality_checks: true
    use_build_context_synchronously: true
    use_colored_box: true
    use_decorated_box: true
    use_enums: true
    use_full_hex_values_for_flutter_colors: true
    use_function_type_syntax_for_parameters: true
    use_if_null_to_convert_nulls_to_bools: true
    use_is_even_rather_than_modulo: true
    use_key_in_widget_constructors: true
    use_late_for_private_fields_and_variables: true
    use_named_constants: true
    use_raw_strings: true
    use_rethrow_when_possible: true
    use_setters_to_change_properties: true
    use_string_buffers: true
    use_super_parameters: true
    use_test_throws_matchers: true
    use_to_and_as_if_applicable: true
    valid_regexps: true
    void_checks: true
```

### 4. Testing Konfigürasyonu
```bash
# Test klasör yapısını oluşturun
mkdir -p test/{unit,widget,integration}
mkdir -p test/fixtures
mkdir -p test/mocks

# Test bağımlılıklarını yükleyin
flutter pub add --dev mockito
flutter pub add --dev integration_test
```

## 🐛 Troubleshooting

### Yaygın Sorunlar ve Çözümleri

#### 1. Flutter Doctor Sorunları
```bash
# Flutter doctor çıktısını kontrol edin
flutter doctor -v

# Eksik bileşenleri yükleyin
flutter doctor --android-licenses
```

#### 2. Bağımlılık Sorunları
```bash
# Cache'i temizleyin
flutter clean
flutter pub cache clean

# Bağımlılıkları yeniden yükleyin
flutter pub get
```

#### 3. Build Sorunları
```bash
# Build cache'i temizleyin
flutter clean
rm -rf build/
rm -rf .dart_tool/

# Yeniden build edin
flutter pub get
flutter build apk
```

#### 4. iOS Spesifik Sorunlar
```bash
# iOS build cache'i temizleyin
cd ios
rm -rf Pods/
rm -rf Podfile.lock
pod install
cd ..

# iOS simulator'ı yeniden başlatın
xcrun simctl shutdown all
xcrun simctl boot "iPhone 14"
```

#### 5. Android Spesifik Sorunlar
```bash
# Android build cache'i temizleyin
cd android
./gradlew clean
cd ..

# Android emulator'ı yeniden başlatın
adb kill-server
adb start-server
```

### Debug Araçları
```bash
# Flutter debug modunda çalıştırın
flutter run --debug

# Verbose logging ile çalıştırın
flutter run --verbose

# Hot reload ile çalıştırın
flutter run --hot
```

### Performance Profiling
```bash
# Performance profiling
flutter run --profile

# Memory profiling
flutter run --trace-startup
```

---

**Son Güncelleme**: 2024
**Versiyon**: 1.0.0
**Geliştirici**: Ajans Hoş İşler Team


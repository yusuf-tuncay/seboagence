# 🚀 Ajans Hoş İşler - Deployment Rehberi

Bu dokümantasyon, Ajans Hoş İşler Flutter uygulamasının production ortamına çıkış süreçlerini, konfigürasyonlarını ve best practices'lerini detaylı bir şekilde açıklar.

## 📋 İçindekiler
- [Deployment Genel Bakış](#deployment-genel-bakış)
- [Build Konfigürasyonları](#build-konfigürasyonları)
- [Platform Spesifik Deployment](#platform-spesifik-deployment)
- [CI/CD Pipeline](#cicd-pipeline)
- [Environment Management](#environment-management)
- [Monitoring & Analytics](#monitoring--analytics)
- [Troubleshooting](#troubleshooting)

## 🎯 Deployment Genel Bakış

### Deployment Stratejisi
- **Staging Environment**: Test ortamı
- **Production Environment**: Canlı ortam
- **Blue-Green Deployment**: Sıfır downtime deployment
- **Rollback Strategy**: Geri alma stratejisi

### Deployment Pipeline
```
Development → Staging → Production
     ↓           ↓         ↓
   Local      Testing    Live
   Build      Build     Build
```

## 🔧 Build Konfigürasyonları

### 1. Flutter Build Konfigürasyonu

#### Debug Build
```bash
# Debug build (development)
flutter build apk --debug
flutter build ios --debug
flutter build web --debug
```

#### Release Build
```bash
# Release build (production)
flutter build apk --release
flutter build ios --release
flutter build web --release
```

#### Profile Build
```bash
# Profile build (performance testing)
flutter build apk --profile
flutter build ios --profile
flutter build web --profile
```

### 2. Build Optimizasyonları

#### Android Build Optimizasyonu
```gradle
// android/app/build.gradle
android {
    compileSdkVersion 34
    
    defaultConfig {
        applicationId "com.sebo.agency"
        minSdkVersion 21
        targetSdkVersion 34
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
        
        // Proguard optimization
        proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
    }
    
    buildTypes {
        release {
            // Code shrinking
            minifyEnabled true
            // Resource shrinking
            shrinkResources true
            // Proguard optimization
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
            
            // Signing config
            signingConfig signingConfigs.release
        }
    }
    
    // Bundle optimization
    bundle {
        language {
            enableSplit = true
        }
        density {
            enableSplit = true
        }
        abi {
            enableSplit = true
        }
    }
}
```

#### iOS Build Optimizasyonu
```ruby
# ios/Podfile
platform :ios, '12.0'

# Performance optimizations
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      
      # Optimization flags
      config.build_settings['GCC_OPTIMIZATION_LEVEL'] = '3'
      config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-O'
      
      # Bitcode optimization
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
end
```

#### Web Build Optimizasyonu
```dart
// web/index.html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ajans Hoş İşler</title>
  
  <!-- Performance optimizations -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  
  <!-- Critical CSS -->
  <style>
    /* Critical CSS for above-the-fold content */
  </style>
</head>
<body>
  <script>
    // Service worker registration
    if ('serviceWorker' in navigator) {
      window.addEventListener('load', function() {
        navigator.serviceWorker.register('/flutter_service_worker.js');
      });
    }
  </script>
</body>
</html>
```

## 📱 Platform Spesifik Deployment

### 1. Android Deployment

#### Google Play Store
```bash
# 1. Release APK oluşturma
flutter build apk --release

# 2. App Bundle oluşturma (önerilen)
flutter build appbundle --release

# 3. Signing konfigürasyonu
# android/app/build.gradle
android {
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile']
            storePassword keystoreProperties['storePassword']
        }
    }
}
```

#### APK Signing
```bash
# Keystore oluşturma
keytool -genkey -v -keystore sebo-agency-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias sebo-agency

# APK imzalama
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore sebo-agency-key.jks app-release-unsigned.apk sebo-agency

# APK optimize etme
zipalign -v 4 app-release-unsigned.apk app-release.apk
```

### 2. iOS Deployment

#### App Store Connect
```bash
# 1. iOS build oluşturma
flutter build ios --release

# 2. Archive oluşturma (Xcode ile)
# Xcode > Product > Archive

# 3. App Store Connect'e yükleme
# Xcode > Window > Organizer > Distribute App
```

#### TestFlight
```bash
# TestFlight için build
flutter build ios --release --no-codesign

# Xcode'da archive ve TestFlight'a yükleme
```

### 3. Web Deployment

#### Firebase Hosting
```bash
# 1. Firebase CLI kurulumu
npm install -g firebase-tools

# 2. Firebase login
firebase login

# 3. Firebase init
firebase init hosting

# 4. Web build
flutter build web --release

# 5. Deploy
firebase deploy
```

#### Netlify
```yaml
# netlify.toml
[build]
  publish = "build/web"
  command = "flutter build web --release"

[build.environment]
  FLUTTER_VERSION = "3.16.0"
```

#### Vercel
```json
{
  "version": 2,
  "builds": [
    {
      "src": "build/web/**",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/build/web/$1"
    }
  ]
}
```

## 🔄 CI/CD Pipeline

### 1. GitHub Actions

#### Android CI/CD
```yaml
# .github/workflows/android.yml
name: Android CI/CD

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Java
      uses: actions/setup-java@v3
      with:
        java-version: '17'
        distribution: 'temurin'
    
    - name: Setup Flutter
      uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.16.0'
        channel: 'stable'
    
    - name: Get dependencies
      run: flutter pub get
    
    - name: Run tests
      run: flutter test
    
    - name: Build APK
      run: flutter build apk --release
    
    - name: Build App Bundle
      run: flutter build appbundle --release
    
    - name: Upload APK
      uses: actions/upload-artifact@v3
      with:
        name: app-release.apk
        path: build/app/outputs/flutter-apk/app-release.apk
    
    - name: Upload App Bundle
      uses: actions/upload-artifact@v3
      with:
        name: app-release.aab
        path: build/app/outputs/bundle/release/app-release.aab
```

#### iOS CI/CD
```yaml
# .github/workflows/ios.yml
name: iOS CI/CD

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: macos-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Flutter
      uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.16.0'
        channel: 'stable'
    
    - name: Get dependencies
      run: flutter pub get
    
    - name: Run tests
      run: flutter test
    
    - name: Build iOS
      run: flutter build ios --release --no-codesign
    
    - name: Upload iOS build
      uses: actions/upload-artifact@v3
      with:
        name: ios-build
        path: build/ios/iphoneos/Runner.app
```

#### Web CI/CD
```yaml
# .github/workflows/web.yml
name: Web CI/CD

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Flutter
      uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.16.0'
        channel: 'stable'
    
    - name: Get dependencies
      run: flutter pub get
    
    - name: Run tests
      run: flutter test
    
    - name: Build Web
      run: flutter build web --release
    
    - name: Deploy to Firebase
      uses: FirebaseExtended/action-hosting-deploy@v0
      with:
        repoToken: '${{ secrets.GITHUB_TOKEN }}'
        firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT }}'
        channelId: live
        projectId: sebo-agency
```

### 2. GitLab CI/CD

#### GitLab Pipeline
```yaml
# .gitlab-ci.yml
stages:
  - test
  - build
  - deploy

variables:
  FLUTTER_VERSION: "3.16.0"

test:
  stage: test
  image: cirrusci/flutter:stable
  script:
    - flutter pub get
    - flutter test
    - flutter analyze

build_android:
  stage: build
  image: cirrusci/flutter:stable
  script:
    - flutter pub get
    - flutter build apk --release
    - flutter build appbundle --release
  artifacts:
    paths:
      - build/app/outputs/flutter-apk/app-release.apk
      - build/app/outputs/bundle/release/app-release.aab

build_ios:
  stage: build
  image: cirrusci/flutter:stable
  script:
    - flutter pub get
    - flutter build ios --release --no-codesign
  artifacts:
    paths:
      - build/ios/iphoneos/Runner.app

build_web:
  stage: build
  image: cirrusci/flutter:stable
  script:
    - flutter pub get
    - flutter build web --release
  artifacts:
    paths:
      - build/web

deploy_web:
  stage: deploy
  image: alpine:latest
  script:
    - apk add --no-cache rsync
    - rsync -av build/web/ $DEPLOY_PATH/
  only:
    - main
```

## 🌍 Environment Management

### 1. Environment Konfigürasyonları

#### Development Environment
```dart
// lib/core/config/environment.dart
class Environment {
  static const String _environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'development');
  
  static bool get isDevelopment => _environment == 'development';
  static bool get isStaging => _environment == 'staging';
  static bool get isProduction => _environment == 'production';
  
  static String get apiBaseUrl {
    switch (_environment) {
      case 'development':
        return 'https://dev-api.seboagency.com';
      case 'staging':
        return 'https://staging-api.seboagency.com';
      case 'production':
        return 'https://api.seboagency.com';
      default:
        return 'https://dev-api.seboagency.com';
    }
  }
  
  static String get appName {
    switch (_environment) {
      case 'development':
        return 'Ajans Hoş İşler (Dev)';
      case 'staging':
        return 'Ajans Hoş İşler (Staging)';
      case 'production':
        return 'Ajans Hoş İşler';
      default:
        return 'Ajans Hoş İşler (Dev)';
    }
  }
}
```

#### Build Scripts
```bash
#!/bin/bash
# scripts/build.sh

ENVIRONMENT=${1:-development}

echo "Building for environment: $ENVIRONMENT"

# Flutter build with environment
flutter build apk --release --dart-define=ENVIRONMENT=$ENVIRONMENT
flutter build ios --release --dart-define=ENVIRONMENT=$ENVIRONMENT
flutter build web --release --dart-define=ENVIRONMENT=$ENVIRONMENT

echo "Build completed for $ENVIRONMENT"
```

### 2. Environment Variables

#### Android Environment Variables
```gradle
// android/app/build.gradle
android {
    defaultConfig {
        buildConfigField "String", "API_BASE_URL", "\"${getApiBaseUrl()}\""
        buildConfigField "String", "APP_NAME", "\"${getAppName()}\""
    }
}

def getApiBaseUrl() {
    def environment = project.hasProperty('ENVIRONMENT') ? project.property('ENVIRONMENT') : 'development'
    switch (environment) {
        case 'production':
            return 'https://api.seboagency.com'
        case 'staging':
            return 'https://staging-api.seboagency.com'
        default:
            return 'https://dev-api.seboagency.com'
    }
}
```

#### iOS Environment Variables
```swift
// ios/Runner/Config.xcconfig
ENVIRONMENT = development
API_BASE_URL = https://dev-api.seboagency.com
APP_NAME = Ajans Hoş İşler (Dev)
```

## 📊 Monitoring & Analytics

### 1. Crash Reporting

#### Firebase Crashlytics
```dart
// lib/core/services/crashlytics_service.dart
class CrashlyticsService {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
  
  static Future<void> recordError(dynamic exception, StackTrace? stackTrace) async {
    await FirebaseCrashlytics.instance.recordError(
      exception,
      stackTrace,
      fatal: false,
    );
  }
  
  static Future<void> setUserIdentifier(String identifier) async {
    await FirebaseCrashlytics.instance.setUserIdentifier(identifier);
  }
}
```

### 2. Analytics

#### Firebase Analytics
```dart
// lib/core/services/analytics_service.dart
class AnalyticsService {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  }
  
  static Future<void> logEvent(String name, Map<String, dynamic> parameters) async {
    await FirebaseAnalytics.instance.logEvent(
      name: name,
      parameters: parameters,
    );
  }
  
  static Future<void> setUserProperty(String name, String value) async {
    await FirebaseAnalytics.instance.setUserProperty(
      name: name,
      value: value,
    );
  }
}
```

### 3. Performance Monitoring

#### Firebase Performance
```dart
// lib/core/services/performance_service.dart
class PerformanceService {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
    await FirebasePerformance.instance.setPerformanceCollectionEnabled(true);
  }
  
  static Trace startTrace(String name) {
    return FirebasePerformance.instance.newTrace(name);
  }
  
  static Future<void> stopTrace(Trace trace) async {
    await trace.stop();
  }
}
```

## 🐛 Troubleshooting

### 1. Build Sorunları

#### Android Build Sorunları
```bash
# Gradle cache temizleme
cd android
./gradlew clean
cd ..

# Flutter cache temizleme
flutter clean
flutter pub get

# Build cache temizleme
rm -rf build/
rm -rf .dart_tool/
```

#### iOS Build Sorunları
```bash
# iOS build cache temizleme
cd ios
rm -rf Pods/
rm -rf Podfile.lock
pod install
cd ..

# Xcode cache temizleme
rm -rf ~/Library/Developer/Xcode/DerivedData/
```

#### Web Build Sorunları
```bash
# Web build cache temizleme
flutter clean
flutter pub get
flutter build web --release

# Service worker cache temizleme
rm -rf build/web/flutter_service_worker.js
```

### 2. Deployment Sorunları

#### APK Signing Sorunları
```bash
# Keystore doğrulama
keytool -list -v -keystore sebo-agency-key.jks

# APK doğrulama
jarsigner -verify -verbose -certs app-release.apk
```

#### App Store Sorunları
```bash
# App Store Connect API key doğrulama
xcrun altool --list-providers -u "your-email@example.com" -p "your-password"

# Build doğrulama
xcrun altool --validate-app -f "app.ipa" -t ios -u "your-email@example.com" -p "your-password"
```

### 3. Performance Sorunları

#### Memory Leaks
```dart
// Memory leak önleme
class ProjectCard extends StatefulWidget {
  @override
  void dispose() {
    // Controller'ları temizle
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
```

#### Image Optimization
```dart
// Görsel optimizasyonu
CachedNetworkImage(
  imageUrl: project.thumbnail,
  memCacheWidth: 300,
  memCacheHeight: 200,
  maxWidthDiskCache: 300,
  maxHeightDiskCache: 200,
)
```

---

**Son Güncelleme**: 2024
**Versiyon**: 1.0.0
**Geliştirici**: Ajans Hoş İşler Team


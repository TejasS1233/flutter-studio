# Flutter Studio - Complete System

A modern Flutter component library with an interactive theme customization website.

##  Projects

### [`flutter_studio/`](flutter_studio/)

The main Flutter component library published to pub.dev. Contains 40+ customizable UI components with a flexible theme system.

**For users:** Install via `flutter pub add flutter_studio`

### [`flutter_web_preview/`](flutter_web_preview/)

Interactive web application for customizing and previewing components. Users can:

- Customize theme (colors, typography, spacing, radius, shadows, fonts)
- Preview components in real-time on mobile/desktop frames
- Export customized theme files as a ZIP

**For deployment:** Deploy to your hosting platform to provide users with a theme generator.

##  Quick Start

### Publish the Library

```bash
cd flutter_studio
dart pub publish
```

### Run the Website Locally

```bash
cd flutter_web_preview
flutter run -d chrome
```

### Deploy the Website

```bash
cd flutter_web_preview
flutter build web
# Deploy the build/web/ directory to your hosting
```

##  User Workflow

1. Install library: `flutter pub add flutter_studio`
2. Visit your website to customize theme
3. Download ZIP with customized theme files
4. Copy theme files to their Flutter project
5. Import and use components with custom theme

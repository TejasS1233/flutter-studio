# Flutter Studio Preview

Interactive web application for previewing, customizing, and exporting Flutter UI components with real-time theme customization.

## Live Demo

Visit [flutterstudio.vercel.app](https://flutterstudio.vercel.app) to try it out.

## Running Locally

```bash
cd flutter_web_preview
flutter pub get
flutter run -d chrome
```

## Features

### Component Library
- 40+ pre-built Flutter UI components
- Real-time preview in mobile phone frame
- Component property customization panel
- Interactive component selection

### Preset UI Layouts
- Dashboard layout with stats, progress, and alerts
- Profile layout with avatar, bio, and settings
- Social feed layout with posts and interactions
- Form layout with various input types
- Settings layout with toggles and preferences

### Theme System
- Global theme customization with 40+ color properties
- Popular app theme presets (Netflix, Amazon, Flipkart, Spotify, YouTube, Instagram)
- Typography control with Google Fonts integration
- Adjustable scales for radius, spacing, shadows, and font sizes
- Real-time theme preview across all components

### Export Functionality
- Download components as ZIP file
- Includes theme configuration files
- Example code and usage documentation
- Ready-to-integrate into Flutter projects

## Technology Stack

- Flutter Web
- Provider for state management
- Google Fonts for typography
- Flutter ColorPicker for color customization
- Archive package for ZIP generation

## Project Structure

```
lib/
├── models/
│   ├── app_state.dart           # Global state management
│   ├── component_config.dart    # Component definitions
│   ├── components_data.dart     # Component metadata
│   └── global_theme.dart        # Theme system
├── screens/
│   └── preview_screen.dart      # Main application screen
├── widgets/
│   ├── component_selector.dart  # Component picker
│   ├── customization_panel.dart # Property editor
│   ├── mobile_phone_frame.dart  # Preview frame with layouts
│   └── theme_customizer.dart    # Theme editor
└── services/
    ├── code_generator.dart      # Code generation
    ├── component_code_generator.dart # Theme file generation
    ├── download_helper.dart     # Browser download helper
    └── zip_builder.dart         # ZIP file builder
```

## Documentation

Full component documentation available at [docs-flutterstudio.vercel.app](https://docs-flutterstudio.vercel.app)

## Related Projects

- [flutter_studio](../flutter_studio) - Core component library
- [flutter_studio_cli](../flutter_studio_cli) - CLI tool for component generation
- [flutter_studio_docs](../flutter_studio_docs) - VitePress documentation site

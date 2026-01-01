# Installation

Get started with Flutter Studio in minutes.

## Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)

## CLI Installation (Recommended)

The CLI tool is the recommended way to use Flutter Studio in production applications.

### 1. Install the CLI

```bash
dart pub global activate flutter_studio_cli
```

### 2. Verify Installation

```bash
flutter_studio --version
```

### 3. Initialize Your Project

Navigate to your Flutter project and run:

```bash
flutter_studio init
```

This will:

- Create a `components/` directory
- Set up necessary configuration
- Prepare your project for component imports

### 4. Add Components

```bash
# Add specific components
flutter_studio add button card

# Add multiple components at once
flutter_studio add button card dialog alert avatar

# List all available components
flutter_studio list
```

### 5. Use the Component

```dart
import 'package:your_app/components/custom_button.dart';

CustomButton(
  text: 'Click Me',
  onPressed: () {
    print('Button pressed!');
  },
)
```

## Package Installation (Alternative)

For rapid prototyping and demos, you can use the traditional package approach.

### 1. Add Dependency

```bash
flutter pub add flutter_studio
```

Or manually add to `pubspec.yaml`:

```yaml
dependencies:
  flutter_studio: ^1.0.0
```

### 2. Import and Use

```dart
import 'package:flutter_studio/flutter_studio.dart';

CustomButton(
  text: 'Click Me',
  onPressed: () {},
)
```

## IDE Setup

### VS Code

Install the Flutter and Dart extensions for the best development experience:

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X / Cmd+Shift+X)
3. Search for "Flutter" and install
4. Search for "Dart" and install

### Android Studio / IntelliJ

Flutter and Dart plugins come pre-installed with the Flutter SDK setup.

## Troubleshooting

### CLI not found

If `flutter_studio` command is not found after installation:

```bash
# Add Dart global bin to your PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

# For Windows (PowerShell)
$env:Path += ";$env:LOCALAPPDATA\Pub\Cache\bin"
```

### Permission Issues (macOS/Linux)

```bash
sudo dart pub global activate flutter_studio_cli
```

### Component Import Errors

Make sure you've run `flutter_studio init` in your project directory before adding components.

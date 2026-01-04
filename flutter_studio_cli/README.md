# Flutter Studio CLI

**Production-grade component installation for Flutter.** Add beautiful, customizable UI components directly to your project—own the code, zero runtime dependencies, infinite customization.

## Why CLI Over Package?

Traditional packages lock you into their implementation. The Flutter Studio CLI gives you complete ownership of your UI code.

| Feature             | CLI (Recommended)         | Package                |
| ------------------- | ------------------------- | ---------------------- |
| **Code Ownership**  | ✅ Lives in your codebase | ❌ External dependency |
| **Customization**   | ✅ Modify freely          | ⚠️ Limited to props    |
| **Bundle Size**     | ✅ Only what you add      | ⚠️ Full package        |
| **Version Control** | ✅ Track changes          | ❌ Version only        |
| **Type Safety**     | ✅ Full access            | ⚠️ API surface only    |

## Installation

Install globally using pub:

```bash
dart pub global activate flutter_studio_cli
```

Or with Flutter:

```bash
flutter pub global activate flutter_studio_cli
```

## Usage

### Initialize Flutter Studio in your project

```bash
flutter_studio init
```

This creates `lib/components/` and `lib/theme/` directories and downloads all theme files (colors, typography, spacing, radius, shadows).

### Add components to your project

```bash
flutter_studio add button card textfield
```

Components are copied directly into your project under `lib/components/`. You own the code and can customize it however you want.

### List available components

```bash
flutter_studio list
```

## Available Components (40+)

**Buttons & Inputs:** button, textfield, textarea, checkbox, radio, switch, slider, select, dropdown

**Layout:** card, appbar, bottomnavbar, tabs, divider

**Navigation:** breadcrumb, pagination

**Feedback:** alert, toast, dialog, spinner, progress, skeleton

**Display:** badge, chip, avatar, tooltip, empty

**Advanced:** table, accordion, bottomsheet, popover, formfield, togglegroup

## Production Benefits

- **Own Your Code**: Components live in your project. Customize them without constraints.
- **Zero Runtime Dependencies**: No external packages in your dependency tree.
- **Theme Integration**: Components respect your app's theme configuration.
- **Version Control**: Track every component change in your Git history.
- **Bundle Optimization**: Only the components you use are in your build.
- **Type Safety**: Full access to implementation details, not just public APIs.

## Example Workflow

```bash
# Navigate to your Flutter project
cd my_flutter_app

# Initialize Flutter Studio
flutter_studio init

# Add components you need
flutter_studio add button card badge dialog

# Use them in your code
import 'package:my_flutter_app/components/custom_button.dart';
import 'package:my_flutter_app/components/custom_card.dart';

// Customize freely - it's your code now!
```

## Rapid Prototyping Alternative

For quick mockups where customization isn't critical, use the package:

```bash
flutter pub add flutter_studio
```

[View Package Documentation →](https://pub.dev/packages/flutter_studio)

## Links

- **GitHub Repository**: [github.com/TejasS1233/flutter-studio](https://github.com/TejasS1233/flutter-studio)
- **Flutter Studio Package**: [pub.dev/packages/flutter_studio](https://pub.dev/packages/flutter_studio)
- **Live Component Preview**: [flutterstudio.vercel.app](https://flutterstudio.vercel.app)

## License

MIT

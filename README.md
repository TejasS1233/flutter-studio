# Flutter Studio

**Production-ready Flutter components that you own.** Copy components directly into your project with our CLI tool, or use the package for rapid prototyping.

## Recommended: CLI Tool (Production Mode)

The Flutter Studio CLI lets you add components directly to your codebase—no runtime dependencies, complete control, infinite customization.

**Installation:**

```bash
dart pub global activate flutter_studio_cli
```

**Usage:**

```bash
flutter_studio init                    # Setup your project
flutter_studio add button card dialog  # Copy components you need
flutter_studio list                    # View all 40+ components
```

**Why CLI-First?**

| Feature             | CLI (Production)           | Package (Prototype)      |
| ------------------- | -------------------------- | ------------------------ |
| **Code Ownership**  | Code lives in your project | External dependency      |
| **Customization**   | Modify anything freely     | Limited to exposed props |
| **Runtime Deps**    | Zero dependencies          | Package adds to bundle   |
| **Dark Mode**       | Uses your Theme            | Static colors            |
| **Version Control** | Track component changes    | Package version only     |
| **Bundle Size**     | Only what you use          | Entire package           |

### Available Components (40+)

**Buttons & Inputs:** button, textfield, textarea, checkbox, radio, switch, slider, select, dropdown

**Layout:** card, appbar, bottomnavbar, tabs, divider

**Navigation:** breadcrumb, pagination

**Feedback:** alert, toast, dialog, spinner, progress, skeleton

**Display:** badge, chip, avatar, tooltip, empty

**Advanced:** table, accordion, bottomsheet, popover, formfield, togglegroup

## Alternative: Package Mode (Rapid Prototyping)

Use the traditional package for quick mockups and demos where customization isn't critical.

**Installation:**

```bash
flutter pub add flutter_studio
```

**Usage:**

```dart
import 'package:flutter_studio/flutter_studio.dart';

// Use components directly
CustomButton(
  text: 'Click Me',
  onPressed: () {},
)
```

**When to use Package Mode:**

- Building quick prototypes or demos
- Testing UI concepts rapidly
- Don't need extensive customization
- Prefer convenience over control

## Projects

### [`flutter_studio_cli/`](flutter_studio_cli/)

CLI tool for production development. Copy components into your project with full customization control.

- **Docs:** [CLI README](flutter_studio_cli/README.md)
- **Package:** [pub.dev/packages/flutter_studio_cli](https://pub.dev/packages/flutter_studio_cli)

### [`flutter_studio/`](flutter_studio/)

Component library package for rapid prototyping and demos.

- **Package:** [pub.dev/packages/flutter_studio](https://pub.dev/packages/flutter_studio)

### [`flutter_web_preview/`](flutter_web_preview/)

Interactive web application for customizing and previewing components in real-time.

**Features:**

- Customize theme (colors, typography, spacing, radius, shadows, fonts)
- Preview components on mobile/desktop frames
- Export customized theme files as ZIP

**Live Demo:** [https://flutterstudio.vercel.app](https://flutterstudio.vercel.app)

> **Note:** The live demo is a static Flutter web build optimized for component preview functionality. The UI is currently non-responsive and best viewed on desktop. A fully responsive web experience is under development.

### [`flutter_studio_docs/`](flutter_studio_docs/)

Complete documentation website built with VitePress, featuring detailed component documentation, installation guides, and theming instructions.

**Features:**

- Comprehensive component documentation with API references
- Getting started guides and installation instructions
- CLI vs Package mode comparison
- Theming and customization guides
- Search functionality and responsive design


## Links

- **Documentation:** Coming soon
- **CLI Tool:** [pub.dev/packages/flutter_studio_cli](https://pub.dev/packages/flutter_studio_cli)
- **Package:** [pub.dev/packages/flutter_studio](https://pub.dev/packages/flutter_studio)
- **Live Demo:** [flutterstudio.vercel.app](https://flutterstudio.vercel.app)
- **GitHub:** [github.com/TejasS1233/flutter-studio](https://github.com/TejasS1233/flutter-studio)

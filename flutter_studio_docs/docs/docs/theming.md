# Theming

Customize Flutter Studio components to match your brand and design system.

## Theme Integration

Flutter Studio components automatically adapt to your app's theme defined in `MaterialApp`:

```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    // Components use these theme values
  ),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    // Components adapt to dark mode
  ),
  themeMode: ThemeMode.system,
  home: MyHomePage(),
)
```

## Color Customization

### Using Theme Colors

Components respect your theme's color scheme:

```dart
ThemeData(
  primaryColor: Colors.purple,
  colorScheme: ColorScheme.light(
    primary: Colors.purple,
    secondary: Colors.amber,
    error: Colors.red,
    surface: Colors.white,
    background: Colors.grey[50]!,
  ),
)
```

### Custom Component Colors

Override colors on individual components:

```dart
CustomButton(
  text: 'Custom',
  backgroundColor: Colors.purple,
  textColor: Colors.white,
  onPressed: () {},
)

CustomCard(
  backgroundColor: Colors.blue[50],
  child: Text('Custom colored card'),
)
```

## Typography

### Theme Text Styles

Define text styles in your theme:

```dart
ThemeData(
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 16),
    bodyText2: TextStyle(fontSize: 14),
  ),
)
```

Components use appropriate text styles automatically.

### Custom Fonts

```dart
ThemeData(
  fontFamily: 'Poppins',
  textTheme: GoogleFonts.poppinsTextTheme(
    Theme.of(context).textTheme,
  ),
)
```

## Dark Mode

### Automatic Dark Mode

Components automatically adapt when you define dark theme:

```dart
MaterialApp(
  theme: ThemeData.light(),
  darkTheme: ThemeData.dark(),
  themeMode: ThemeMode.system, // Follows system preference
)
```

### Manual Toggle

```dart
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: MyHomePage(onToggleTheme: _toggleTheme),
    );
  }
}
```

## Component Variants

Many components support visual variants:

```dart
// Button variants
CustomButton(variant: ButtonVariant.primary)
CustomButton(variant: ButtonVariant.secondary)
CustomButton(variant: ButtonVariant.outlined)
CustomButton(variant: ButtonVariant.text)

// Card variants
CustomCard(variant: CardVariant.elevated)
CustomCard(variant: CardVariant.outlined)
CustomCard(variant: CardVariant.filled)
```

## Advanced Customization (CLI Mode)

When using CLI mode, you own the component code and can customize deeply:

### 1. Modify Component Defaults

```dart
// lib/components/custom_button.dart

class CustomButton extends StatelessWidget {
  // Change default values
  final BorderRadius borderRadius;

  const CustomButton({
    this.borderRadius = const BorderRadius.all(Radius.circular(12)), // Changed from 8
    // ...
  });
}
```

### 2. Add Brand-Specific Styles

```dart
// lib/theme/button_styles.dart

class BrandButtonStyles {
  static final primary = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(BrandColors.purple),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
```

### 3. Create Component Variants

```dart
// lib/components/custom_button.dart

enum ButtonVariant {
  primary,
  secondary,
  gradient, // Your custom variant
}

// In build method:
if (variant == ButtonVariant.gradient) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.purple, Colors.blue],
      ),
    ),
    child: // button content
  );
}
```

## Design Tokens

Create a central design system:

```dart
// lib/theme/design_tokens.dart

class DesignTokens {
  // Colors
  static const primaryColor = Color(0xFF6366F1);
  static const secondaryColor = Color(0xFFF59E0B);

  // Spacing
  static const spacing4 = 4.0;
  static const spacing8 = 8.0;
  static const spacing16 = 16.0;

  // Border Radius
  static const radiusSmall = 4.0;
  static const radiusMedium = 8.0;
  static const radiusLarge = 16.0;

  // Shadows
  static final shadow1 = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 4,
    offset: Offset(0, 2),
  );
}
```

Use tokens in components:

```dart
CustomButton(
  backgroundColor: DesignTokens.primaryColor,
  borderRadius: BorderRadius.circular(DesignTokens.radiusMedium),
)
```

## Web Theme Customizer

Use the **[Flutter Studio Playground](https://flutterstudio.vercel.app)** to:

1. Customize colors, typography, spacing
2. Preview components with your theme
3. Export theme configuration
4. Download as Dart files

## Example: Complete Brand Theme

```dart
// lib/theme/app_theme.dart

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    brightness: Brightness.light,

    colorScheme: ColorScheme.light(
      primary: Color(0xFF6366F1),
      secondary: Color(0xFFF59E0B),
      surface: Colors.white,
      background: Color(0xFFF9FAFB),
      error: Color(0xFFEF4444),
    ),

    textTheme: GoogleFonts.interTextTheme(
      TextTheme(
        headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16),
      ),
    ),

    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // Dark theme values...
  );
}
```

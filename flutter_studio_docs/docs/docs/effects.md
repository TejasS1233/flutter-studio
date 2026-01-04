# Visual Effects

Flutter Studio provides a set of visual effect utilities and widgets to enhance your UI with modern design trends.

## UIEffects Class

Static helper methods for creating decorations with effects:

```dart
import 'package:flutter_studio/flutter_studio.dart';

// Glassmorphism
Container(
  decoration: UIEffects.glassDecoration(
    baseColor: Colors.white,
    blur: 10.0,
    opacity: 0.2,
  ),
  child: Text('Frosted glass effect'),
)

// Neumorphism
Container(
  decoration: UIEffects.neumorphismDecoration(
    baseColor: Colors.grey[200]!,
    intensity: 0.5,
  ),
  child: Text('Soft 3D shadows'),
)

// Gradient
Container(
  decoration: UIEffects.gradientDecoration(
    startColor: Color(0xFF6366F1),
    endColor: Color(0xFF8B5CF6),
    angle: 135,
  ),
  child: Text('Gradient fill'),
)

// Border Glow
Container(
  decoration: BoxDecoration(
    boxShadow: UIEffects.glowShadows(
      color: Colors.blue,
      intensity: 0.5,
      spread: 4.0,
    ),
  ),
  child: Text('Glowing border'),
)
```

## Effect Widgets

Pre-built widgets for quick application:

### GlassContainer

```dart
GlassContainer(
  blur: 10.0,
  opacity: 0.2,
  padding: EdgeInsets.all(16),
  child: Text('Glass content'),
)
```

### NeumorphicContainer

```dart
NeumorphicContainer(
  intensity: 0.5,
  padding: EdgeInsets.all(16),
  child: Text('Neumorphic content'),
)
```

### GradientContainer

```dart
GradientContainer(
  startColor: Color(0xFF6366F1),
  endColor: Color(0xFF8B5CF6),
  angle: 135,
  padding: EdgeInsets.all(16),
  child: Text('Gradient content'),
)
```

### GlowContainer

```dart
GlowContainer(
  glowColor: Colors.blue,
  intensity: 0.5,
  spread: 4.0,
  padding: EdgeInsets.all(16),
  child: Text('Glowing content'),
)
```

### HoverScaleContainer

```dart
HoverScaleContainer(
  scale: 1.02,
  onTap: () => print('Tapped!'),
  child: Card(child: Text('Hover me')),
)
```

## Best Practices

- Use **glassmorphism** sparingly - it works best on images or colored backgrounds
- **Neumorphism** works best on light, neutral backgrounds
- Combine effects with theme colors for consistency
- **Hover animations** improve desktop and web interactivity

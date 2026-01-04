import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

/// UI Effects - Visual effect utilities and decorations for Flutter Studio
///
/// Provides helper methods and widgets for applying modern visual effects:
/// - Glassmorphism (frosted glass effect)
/// - Neumorphism (soft 3D shadows)
/// - Gradients (customizable color gradients)
/// - Border Glow (illuminated borders)
/// - Hover Animations (interactive scale effects)
class UIEffects {
  UIEffects._();

  /// Apply glassmorphism decoration to a container
  static BoxDecoration glassDecoration({
    required Color baseColor,
    double blur = 10.0,
    double opacity = 0.2,
    double radiusScale = 1.0,
    Color? borderColor,
  }) {
    return BoxDecoration(
      color: baseColor.withOpacity(opacity),
      borderRadius: BorderRadius.circular(12 * radiusScale),
      border: Border.all(
        color: (borderColor ?? Colors.white).withOpacity(0.2),
        width: 1.5,
      ),
    );
  }

  /// Apply neumorphism decoration with soft shadows
  static BoxDecoration neumorphismDecoration({
    required Color baseColor,
    double intensity = 0.5,
    double radiusScale = 1.0,
    bool isPressed = false,
  }) {
    final isDark = baseColor.computeLuminance() < 0.5;
    final lightColor = isDark
        ? Colors.white.withOpacity(0.1 * intensity)
        : Colors.white.withOpacity(0.7 * intensity);
    final darkColor = isDark
        ? Colors.black.withOpacity(0.5 * intensity)
        : Colors.black.withOpacity(0.15 * intensity);

    final offset = isPressed ? 2.0 : 4.0 * intensity;
    final blur = isPressed ? 4.0 : 8.0 * intensity;

    return BoxDecoration(
      color: baseColor,
      borderRadius: BorderRadius.circular(12 * radiusScale),
      boxShadow: [
        BoxShadow(
          color: darkColor,
          offset: Offset(offset, offset),
          blurRadius: blur,
        ),
        BoxShadow(
          color: lightColor,
          offset: Offset(-offset, -offset),
          blurRadius: blur,
        ),
      ],
    );
  }

  /// Create a gradient decoration
  static BoxDecoration gradientDecoration({
    required Color startColor,
    required Color endColor,
    double angle = 135.0,
    double radiusScale = 1.0,
  }) {
    final angleRad = angle * (math.pi / 180);
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(-math.cos(angleRad), -math.sin(angleRad)),
        end: Alignment(math.cos(angleRad), math.sin(angleRad)),
        colors: [startColor, endColor],
      ),
      borderRadius: BorderRadius.circular(12 * radiusScale),
    );
  }

  /// Get glow shadows for border glow effect
  static List<BoxShadow> glowShadows({
    required Color color,
    double intensity = 0.5,
    double spread = 4.0,
  }) {
    return [
      BoxShadow(
        color: color.withOpacity(intensity),
        blurRadius: spread * 2,
        spreadRadius: spread / 2,
      ),
    ];
  }
}

/// Glass Container - A widget that applies glassmorphism effect
class GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double blur;
  final double opacity;

  const GlassContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.blur = 10.0,
    this.opacity = 0.2,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).cardColor;
    final radius = borderRadius ?? BorderRadius.circular(12);

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: bgColor.withOpacity(opacity),
            borderRadius: radius,
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Neumorphic Container - A widget that applies neumorphism effect
class NeumorphicContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double intensity;
  final bool isPressed;

  const NeumorphicContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.intensity = 0.5,
    this.isPressed = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).cardColor;

    return Container(
      padding: padding,
      decoration: UIEffects.neumorphismDecoration(
        baseColor: bgColor,
        intensity: intensity,
        radiusScale: 1.0,
        isPressed: isPressed,
      ).copyWith(borderRadius: borderRadius),
      child: child,
    );
  }
}

/// Gradient Container - A widget that applies gradient effect
class GradientContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color startColor;
  final Color endColor;
  final double angle;

  const GradientContainer({
    super.key,
    required this.child,
    required this.startColor,
    required this.endColor,
    this.padding,
    this.borderRadius,
    this.angle = 135.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: UIEffects.gradientDecoration(
        startColor: startColor,
        endColor: endColor,
        angle: angle,
      ).copyWith(borderRadius: borderRadius),
      child: child,
    );
  }
}

/// Glow Container - A widget that applies border glow effect
class GlowContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color glowColor;
  final double intensity;
  final double spread;

  const GlowContainer({
    super.key,
    required this.child,
    required this.glowColor,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.intensity = 0.5,
    this.spread = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).cardColor;
    final radius = borderRadius ?? BorderRadius.circular(12);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: radius,
        boxShadow: UIEffects.glowShadows(
          color: glowColor,
          intensity: intensity,
          spread: spread,
        ),
      ),
      child: child,
    );
  }
}

/// Animated Hover Container - A widget with hover/tap scale animation
class HoverScaleContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scale;
  final Duration duration;

  const HoverScaleContainer({
    super.key,
    required this.child,
    this.onTap,
    this.scale = 1.02,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<HoverScaleContainer> createState() => _HoverScaleContainerState();
}

class _HoverScaleContainerState extends State<HoverScaleContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: widget.duration,
          transform: _isHovered
              ? (Matrix4.identity()..scale(widget.scale))
              : Matrix4.identity(),
          transformAlignment: Alignment.center,
          child: widget.child,
        ),
      ),
    );
  }
}

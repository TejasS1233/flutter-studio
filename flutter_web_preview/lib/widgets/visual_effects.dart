import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models/global_theme.dart';

/// Visual Effects - Helper widgets and decorations for applying visual effects
class VisualEffects {
  final GlobalTheme theme;

  VisualEffects(this.theme);

  /// Get glassmorphism decoration
  BoxDecoration get glassDecoration {
    if (!theme.enableGlassmorphism) {
      return const BoxDecoration();
    }
    return BoxDecoration(
      color: theme.card.withOpacity(theme.glassOpacity),
      borderRadius: BorderRadius.circular(12 * theme.radiusScale),
      border: Border.all(
        color: theme.border.withOpacity(0.2),
        width: 1.5,
      ),
    );
  }

  /// Get neumorphism decoration (light source from top-left)
  BoxDecoration getNeumorphismDecoration({bool isPressed = false}) {
    if (!theme.enableNeumorphism) {
      return BoxDecoration(
        color: theme.card,
        borderRadius: BorderRadius.circular(12 * theme.radiusScale),
      );
    }

    final intensity = theme.neumorphismIntensity;
    final isDark = theme.background.computeLuminance() < 0.5;
    
    final lightColor = isDark 
        ? Colors.white.withOpacity(0.1 * intensity)
        : Colors.white.withOpacity(0.7 * intensity);
    final darkColor = isDark
        ? Colors.black.withOpacity(0.5 * intensity)
        : Colors.black.withOpacity(0.15 * intensity);

    if (isPressed) {
      return BoxDecoration(
        color: theme.card,
        borderRadius: BorderRadius.circular(12 * theme.radiusScale),
        boxShadow: [
          BoxShadow(
            color: darkColor,
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: lightColor,
            offset: const Offset(-2, -2),
            blurRadius: 4,
          ),
        ],
      );
    }

    return BoxDecoration(
      color: theme.card,
      borderRadius: BorderRadius.circular(12 * theme.radiusScale),
      boxShadow: [
        BoxShadow(
          color: darkColor,
          offset: Offset(4 * intensity, 4 * intensity),
          blurRadius: 8 * intensity,
        ),
        BoxShadow(
          color: lightColor,
          offset: Offset(-4 * intensity, -4 * intensity),
          blurRadius: 8 * intensity,
        ),
      ],
    );
  }

  /// Get gradient decoration
  BoxDecoration get gradientDecoration {
    if (!theme.enableGradients) {
      return BoxDecoration(
        color: theme.card,
        borderRadius: BorderRadius.circular(12 * theme.radiusScale),
      );
    }

    final angleRad = theme.gradientAngle * (math.pi / 180);
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(
          -math.cos(angleRad),
          -math.sin(angleRad),
        ),
        end: Alignment(
          math.cos(angleRad),
          math.sin(angleRad),
        ),
        colors: [theme.gradientStart, theme.gradientEnd],
      ),
      borderRadius: BorderRadius.circular(12 * theme.radiusScale),
    );
  }

  /// Get border glow shadows
  List<BoxShadow> get glowShadows {
    if (!theme.enableBorderGlow) {
      return [];
    }
    return [
      BoxShadow(
        color: theme.glowColor.withOpacity(theme.glowIntensity),
        blurRadius: theme.glowSpread * 2,
        spreadRadius: theme.glowSpread / 2,
      ),
    ];
  }

  /// Get combined decoration with all enabled effects
  BoxDecoration getCombinedDecoration({
    Color? backgroundColor,
    BorderRadius? borderRadius,
    bool isPressed = false,
  }) {
    final radius = borderRadius ?? BorderRadius.circular(12 * theme.radiusScale);
    final bgColor = backgroundColor ?? theme.card;
    
    List<BoxShadow> shadows = [];
    Gradient? gradient;
    Color? finalColor = bgColor;

    // Add neumorphism shadows
    if (theme.enableNeumorphism) {
      final neumDeco = getNeumorphismDecoration(isPressed: isPressed);
      shadows.addAll(neumDeco.boxShadow ?? []);
    }

    // Add glow shadows
    if (theme.enableBorderGlow) {
      shadows.addAll(glowShadows);
    }

    // Gradients are now applied to app background only, not individual components
    // So we skip gradient application here

    // Apply glassmorphism (makes colors semi-transparent, but keeps gradient if set)
    if (theme.enableGlassmorphism && gradient == null) {
      finalColor = bgColor.withOpacity(theme.glassOpacity);
    }

    return BoxDecoration(
      color: gradient == null ? finalColor : null,
      gradient: gradient,
      borderRadius: radius,
      border: theme.enableGlassmorphism
          ? Border.all(
              color: theme.border.withOpacity(0.3),
              width: 1.5,
            )
          : null,
      boxShadow: shadows.isEmpty ? null : shadows,
    );
  }
}

/// Glass Container - Applies glassmorphism effect
class GlassContainer extends StatelessWidget {
  final Widget child;
  final GlobalTheme theme;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const GlassContainer({
    super.key,
    required this.child,
    required this.theme,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (!theme.enableGlassmorphism) {
      return Container(
        padding: padding,
        decoration: BoxDecoration(
          color: theme.card,
          borderRadius: borderRadius ?? BorderRadius.circular(12 * theme.radiusScale),
        ),
        child: child,
      );
    }

    final radius = borderRadius ?? BorderRadius.circular(12 * theme.radiusScale);

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: theme.glassBlur,
          sigmaY: theme.glassBlur,
        ),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: theme.card.withOpacity(theme.glassOpacity),
            borderRadius: radius,
            border: Border.all(
              color: theme.border.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Effect Container - Applies all enabled effects
class EffectContainer extends StatefulWidget {
  final Widget child;
  final GlobalTheme theme;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const EffectContainer({
    super.key,
    required this.child,
    required this.theme,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.onTap,
  });

  @override
  State<EffectContainer> createState() => _EffectContainerState();
}

class _EffectContainerState extends State<EffectContainer> {
  bool _isPressed = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effects = VisualEffects(widget.theme);
    final radius = widget.borderRadius ?? 
        BorderRadius.circular(12 * widget.theme.radiusScale);

    Widget container;

    // If glassmorphism is enabled, use blur effect
    if (widget.theme.enableGlassmorphism) {
      container = ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: widget.theme.glassBlur,
            sigmaY: widget.theme.glassBlur,
          ),
          child: AnimatedContainer(
            duration: widget.theme.enableHoverAnimations 
                ? const Duration(milliseconds: 200)
                : Duration.zero,
            transform: widget.theme.enableHoverAnimations && _isHovered
                ? (Matrix4.identity()..scale(1.02))
                : Matrix4.identity(),
            padding: widget.padding,
            decoration: effects.getCombinedDecoration(
              backgroundColor: widget.backgroundColor,
              borderRadius: radius,
              isPressed: _isPressed,
            ),
            child: widget.child,
          ),
        ),
      );
    } else {
      container = AnimatedContainer(
        duration: widget.theme.enableHoverAnimations 
            ? const Duration(milliseconds: 200)
            : Duration.zero,
        transform: widget.theme.enableHoverAnimations && _isHovered
            ? (Matrix4.identity()..scale(1.02))
            : Matrix4.identity(),
        padding: widget.padding,
        decoration: effects.getCombinedDecoration(
          backgroundColor: widget.backgroundColor,
          borderRadius: radius,
          isPressed: _isPressed,
        ),
        child: widget.child,
      );
    }

    if (widget.onTap != null || widget.theme.enableHoverAnimations) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) {
            setState(() => _isPressed = false);
            widget.onTap?.call();
          },
          onTapCancel: () => setState(() => _isPressed = false),
          child: container,
        ),
      );
    }

    return container;
  }
}

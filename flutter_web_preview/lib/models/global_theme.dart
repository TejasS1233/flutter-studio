import 'package:flutter/material.dart';

class GlobalTheme {
  // Primary Colors
  Color primary;
  Color primaryForeground;

  // Secondary Colors
  Color secondary;
  Color secondaryForeground;

  // Accent Colors
  Color accent;
  Color accentForeground;

  // Base Colors
  Color background;
  Color foreground;

  // Card Colors
  Color card;
  Color cardForeground;

  // Popover Colors
  Color popover;
  Color popoverForeground;

  // Muted Colors
  Color muted;
  Color mutedForeground;

  // Destructive Colors
  Color destructive;
  Color destructiveForeground;

  // Border & Input
  Color border;
  Color input;
  Color ring;

  // Chart Colors (for data visualization)
  Color chart1;
  Color chart2;
  Color chart3;
  Color chart4;
  Color chart5;

  // Scales
  double radiusScale;
  double spacingScale;
  double shadowIntensity;

  // Typography
  double fontSizeScale;
  double lineHeightScale;
  String fontFamily;

  GlobalTheme({
    // Primary
    this.primary = const Color(0xFF09090B),
    this.primaryForeground = const Color(0xFFFAFAFA),

    // Secondary
    this.secondary = const Color(0xFFF4F4F5),
    this.secondaryForeground = const Color(0xFF18181B),

    // Accent
    this.accent = const Color(0xFFF4F4F5),
    this.accentForeground = const Color(0xFF18181B),

    // Base
    this.background = const Color(0xFFFFFFFF),
    this.foreground = const Color(0xFF09090B),

    // Card
    this.card = const Color(0xFFFFFFFF),
    this.cardForeground = const Color(0xFF09090B),

    // Popover
    this.popover = const Color(0xFFFFFFFF),
    this.popoverForeground = const Color(0xFF09090B),

    // Muted
    this.muted = const Color(0xFFF4F4F5),
    this.mutedForeground = const Color(0xFF71717A),

    // Destructive
    this.destructive = const Color(0xFFEF4444),
    this.destructiveForeground = const Color(0xFFFAFAFA),

    // Border & Input
    this.border = const Color(0xFFE4E4E7),
    this.input = const Color(0xFFE4E4E7),
    this.ring = const Color(0xFF09090B),

    // Chart
    this.chart1 = const Color(0xFF6366F1),
    this.chart2 = const Color(0xFF8B5CF6),
    this.chart3 = const Color(0xFFEC4899),
    this.chart4 = const Color(0xFFF59E0B),
    this.chart5 = const Color(0xFF10B981),

    // Scales
    this.radiusScale = 1.0,
    this.spacingScale = 1.0,
    this.shadowIntensity = 1.0,

    // Typography
    this.fontSizeScale = 1.0,
    this.lineHeightScale = 1.0,
    this.fontFamily = 'Inter',
  });

  GlobalTheme copyWith({
    Color? primary,
    Color? primaryForeground,
    Color? secondary,
    Color? secondaryForeground,
    Color? accent,
    Color? accentForeground,
    Color? background,
    Color? foreground,
    Color? card,
    Color? cardForeground,
    Color? popover,
    Color? popoverForeground,
    Color? muted,
    Color? mutedForeground,
    Color? destructive,
    Color? destructiveForeground,
    Color? border,
    Color? input,
    Color? ring,
    Color? chart1,
    Color? chart2,
    Color? chart3,
    Color? chart4,
    Color? chart5,
    double? radiusScale,
    double? spacingScale,
    double? shadowIntensity,
    double? fontSizeScale,
    double? lineHeightScale,
    String? fontFamily,
  }) {
    return GlobalTheme(
      primary: primary ?? this.primary,
      primaryForeground: primaryForeground ?? this.primaryForeground,
      secondary: secondary ?? this.secondary,
      secondaryForeground: secondaryForeground ?? this.secondaryForeground,
      accent: accent ?? this.accent,
      accentForeground: accentForeground ?? this.accentForeground,
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      card: card ?? this.card,
      cardForeground: cardForeground ?? this.cardForeground,
      popover: popover ?? this.popover,
      popoverForeground: popoverForeground ?? this.popoverForeground,
      muted: muted ?? this.muted,
      mutedForeground: mutedForeground ?? this.mutedForeground,
      destructive: destructive ?? this.destructive,
      destructiveForeground:
          destructiveForeground ?? this.destructiveForeground,
      border: border ?? this.border,
      input: input ?? this.input,
      ring: ring ?? this.ring,
      chart1: chart1 ?? this.chart1,
      chart2: chart2 ?? this.chart2,
      chart3: chart3 ?? this.chart3,
      chart4: chart4 ?? this.chart5,
      chart5: chart5 ?? this.chart5,
      radiusScale: radiusScale ?? this.radiusScale,
      spacingScale: spacingScale ?? this.spacingScale,
      shadowIntensity: shadowIntensity ?? this.shadowIntensity,
      fontSizeScale: fontSizeScale ?? this.fontSizeScale,
      lineHeightScale: lineHeightScale ?? this.lineHeightScale,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  // Popular App Theme Presets
  static GlobalTheme netflix() {
    return GlobalTheme(
      primary: const Color(0xFFE50914), // Netflix red
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFF141414), // Dark gray
      secondaryForeground: const Color(0xFFFFFFFF),
      background: const Color(0xFF000000), // Pure black
      foreground: const Color(0xFFFFFFFF),
      card: const Color(0xFF1A1A1A),
      cardForeground: const Color(0xFFFFFFFF),
      muted: const Color(0xFF2D2D2D),
      mutedForeground: const Color(0xFFB3B3B3),
      border: const Color(0xFF333333),
      input: const Color(0xFF2D2D2D),
      ring: const Color(0xFFE50914),
      destructive: const Color(0xFFE50914),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFFE50914),
      accentForeground: const Color(0xFFFFFFFF),
      radiusScale: 0.5,
      fontFamily: 'Inter',
    );
  }

  static GlobalTheme amazon() {
    return GlobalTheme(
      primary: const Color(0xFFFF9900), // Amazon orange
      primaryForeground: const Color(0xFF000000),
      secondary: const Color(0xFF232F3E), // Amazon dark blue
      secondaryForeground: const Color(0xFFFFFFFF),
      background: const Color(0xFFFFFFFF),
      foreground: const Color(0xFF0F1111),
      card: const Color(0xFFFFFFFF),
      cardForeground: const Color(0xFF0F1111),
      muted: const Color(0xFFF5F5F5),
      mutedForeground: const Color(0xFF565959),
      border: const Color(0xFFD5D9D9),
      input: const Color(0xFFFFFFFF),
      ring: const Color(0xFFFF9900),
      destructive: const Color(0xFFC7511F),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF146EB4), // Amazon blue
      accentForeground: const Color(0xFFFFFFFF),
      radiusScale: 0.6,
      fontFamily: 'Open Sans',
    );
  }

  static GlobalTheme flipkart() {
    return GlobalTheme(
      primary: const Color(0xFF2874F0), // Flipkart blue
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFFFFC107), // Flipkart yellow
      secondaryForeground: const Color(0xFF212121),
      background: const Color(0xFFF1F3F6),
      foreground: const Color(0xFF212121),
      card: const Color(0xFFFFFFFF),
      cardForeground: const Color(0xFF212121),
      muted: const Color(0xFFF1F3F6),
      mutedForeground: const Color(0xFF878787),
      border: const Color(0xFFE0E0E0),
      input: const Color(0xFFFFFFFF),
      ring: const Color(0xFF2874F0),
      destructive: const Color(0xFFFF6161),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFFFB641B), // Flipkart orange
      accentForeground: const Color(0xFFFFFFFF),
      radiusScale: 0.3,
      fontFamily: 'Roboto',
    );
  }

  static GlobalTheme spotify() {
    return GlobalTheme(
      primary: const Color(0xFF1DB954), // Spotify green
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFF191414), // Spotify dark
      secondaryForeground: const Color(0xFFFFFFFF),
      background: const Color(0xFF121212),
      foreground: const Color(0xFFFFFFFF),
      card: const Color(0xFF181818),
      cardForeground: const Color(0xFFFFFFFF),
      muted: const Color(0xFF282828),
      mutedForeground: const Color(0xFFB3B3B3),
      border: const Color(0xFF282828),
      input: const Color(0xFF2A2A2A),
      ring: const Color(0xFF1DB954),
      destructive: const Color(0xFFE22134),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF1DB954),
      accentForeground: const Color(0xFFFFFFFF),
      radiusScale: 1.5,
      fontFamily: 'Montserrat',
    );
  }

  static GlobalTheme youtube() {
    return GlobalTheme(
      primary: const Color(0xFFFF0000), // YouTube red
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFF0F0F0F), // Dark background
      secondaryForeground: const Color(0xFFFFFFFF),
      background: const Color(0xFF0F0F0F),
      foreground: const Color(0xFFFFFFFF),
      card: const Color(0xFF1C1C1C),
      cardForeground: const Color(0xFFFFFFFF),
      muted: const Color(0xFF272727),
      mutedForeground: const Color(0xFFAAAAAA),
      border: const Color(0xFF303030),
      input: const Color(0xFF121212),
      ring: const Color(0xFFFF0000),
      destructive: const Color(0xFFFF0000),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF3EA6FF), // YouTube blue
      accentForeground: const Color(0xFFFFFFFF),
      radiusScale: 0.2,
      fontFamily: 'Roboto',
    );
  }

  static GlobalTheme instagram() {
    return GlobalTheme(
      primary: const Color(0xFFE4405F), // Instagram pink
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFF262626), // Dark gray
      secondaryForeground: const Color(0xFFFFFFFF),
      background: const Color(0xFFFAFAFA),
      foreground: const Color(0xFF262626),
      card: const Color(0xFFFFFFFF),
      cardForeground: const Color(0xFF262626),
      muted: const Color(0xFFF5F5F5),
      mutedForeground: const Color(0xFF8E8E8E),
      border: const Color(0xFFDBDBDB),
      input: const Color(0xFFFAFAFA),
      ring: const Color(0xFFE4405F),
      destructive: const Color(0xFFED4956),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF833AB4), // Instagram purple
      accentForeground: const Color(0xFFFFFFFF),
      radiusScale: 1.2,
      fontFamily: 'Poppins',
    );
  }
}

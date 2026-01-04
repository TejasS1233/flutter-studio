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

  // Visual Effects
  bool enableGlassmorphism;
  double glassBlur;
  double glassOpacity;

  bool enableNeumorphism;
  double neumorphismIntensity;

  bool enableGradients;
  Color gradientStart;
  Color gradientEnd;
  double gradientAngle;

  bool enableBorderGlow;
  Color glowColor;
  double glowIntensity;
  double glowSpread;

  bool enableHoverAnimations;

  // Neo-Brutalism style
  double borderWidth;
  bool enableHardShadow;
  double hardShadowOffsetX;
  double hardShadowOffsetY;

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

    // Visual Effects
    this.enableGlassmorphism = false,
    this.glassBlur = 10.0,
    this.glassOpacity = 0.2,

    this.enableNeumorphism = false,
    this.neumorphismIntensity = 0.5,

    this.enableGradients = false,
    this.gradientStart = const Color(0xFF6366F1),
    this.gradientEnd = const Color(0xFF8B5CF6),
    this.gradientAngle = 135.0,

    this.enableBorderGlow = false,
    this.glowColor = const Color(0xFF6366F1),
    this.glowIntensity = 0.5,
    this.glowSpread = 4.0,

    this.enableHoverAnimations = false,

    // Neo-Brutalism defaults
    this.borderWidth = 1.0,
    this.enableHardShadow = false,
    this.hardShadowOffsetX = 4.0,
    this.hardShadowOffsetY = 4.0,
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
    // Visual Effects
    bool? enableGlassmorphism,
    double? glassBlur,
    double? glassOpacity,
    bool? enableNeumorphism,
    double? neumorphismIntensity,
    bool? enableGradients,
    Color? gradientStart,
    Color? gradientEnd,
    double? gradientAngle,
    bool? enableBorderGlow,
    Color? glowColor,
    double? glowIntensity,
    double? glowSpread,
    bool? enableHoverAnimations,
    // Neo-Brutalism
    double? borderWidth,
    bool? enableHardShadow,
    double? hardShadowOffsetX,
    double? hardShadowOffsetY,
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
      chart4: chart4 ?? this.chart4,
      chart5: chart5 ?? this.chart5,
      radiusScale: radiusScale ?? this.radiusScale,
      spacingScale: spacingScale ?? this.spacingScale,
      shadowIntensity: shadowIntensity ?? this.shadowIntensity,
      fontSizeScale: fontSizeScale ?? this.fontSizeScale,
      lineHeightScale: lineHeightScale ?? this.lineHeightScale,
      fontFamily: fontFamily ?? this.fontFamily,
      // Visual Effects
      enableGlassmorphism: enableGlassmorphism ?? this.enableGlassmorphism,
      glassBlur: glassBlur ?? this.glassBlur,
      glassOpacity: glassOpacity ?? this.glassOpacity,
      enableNeumorphism: enableNeumorphism ?? this.enableNeumorphism,
      neumorphismIntensity: neumorphismIntensity ?? this.neumorphismIntensity,
      enableGradients: enableGradients ?? this.enableGradients,
      gradientStart: gradientStart ?? this.gradientStart,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      gradientAngle: gradientAngle ?? this.gradientAngle,
      enableBorderGlow: enableBorderGlow ?? this.enableBorderGlow,
      glowColor: glowColor ?? this.glowColor,
      glowIntensity: glowIntensity ?? this.glowIntensity,
      glowSpread: glowSpread ?? this.glowSpread,
      enableHoverAnimations: enableHoverAnimations ?? this.enableHoverAnimations,
      // Neo-Brutalism
      borderWidth: borderWidth ?? this.borderWidth,
      enableHardShadow: enableHardShadow ?? this.enableHardShadow,
      hardShadowOffsetX: hardShadowOffsetX ?? this.hardShadowOffsetX,
      hardShadowOffsetY: hardShadowOffsetY ?? this.hardShadowOffsetY,
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
      // Netflix has subtle neumorphism on cards
      enableNeumorphism: true,
      neumorphismIntensity: 0.3,
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
      // Spotify uses gradient backgrounds
      enableGradients: true,
      gradientStart: const Color(0xFF1DB954),
      gradientEnd: const Color(0xFF121212),
      gradientAngle: 180.0,
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

  /// Cyberpunk theme - dark mode with neon accents (dev aesthetic)
  static GlobalTheme cyberpunk() {
    return GlobalTheme(
      primary: const Color(0xFF00FF41), // Matrix/neon green
      primaryForeground: const Color(0xFF000000),
      secondary: const Color(0xFFFF00FF), // Neon pink/magenta
      secondaryForeground: const Color(0xFF000000),
      background: const Color(0xFF0D0D0D), // Near black
      foreground: const Color(0xFF00FF41), // Neon green text
      card: const Color(0xFF1A1A2E), // Dark purple-black
      cardForeground: const Color(0xFFE0E0E0),
      muted: const Color(0xFF16213E), // Dark blue
      mutedForeground: const Color(0xFF8B8B8B),
      border: const Color(0xFF00FF41).withOpacity(0.3), // Neon border
      input: const Color(0xFF1A1A2E),
      ring: const Color(0xFF00FF41),
      destructive: const Color(0xFFFF0055), // Neon red
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF00D4FF), // Cyan accent
      accentForeground: const Color(0xFF000000),
      chart1: const Color(0xFF00FF41),
      chart2: const Color(0xFFFF00FF),
      chart3: const Color(0xFF00D4FF),
      chart4: const Color(0xFFFFFF00),
      chart5: const Color(0xFFFF0055),
      radiusScale: 0.3, // Sharp edges
      spacingScale: 1.0,
      shadowIntensity: 0.5,
      fontFamily: 'Ubuntu', // Monospace-ish
      // Enable subtle neon glow effect
      enableBorderGlow: true,
      glowColor: const Color(0xFF00FF41),
      glowIntensity: 0.3, // Reduced for subtler effect
      glowSpread: 4.0,
    );
  }

  /// Neo-Brutalism theme - high contrast, thick black borders, hard offset shadows
  static GlobalTheme neoBrutalism() {
    return GlobalTheme(
      primary: const Color(0xFFFFE600), // Bright yellow
      primaryForeground: const Color(0xFF000000),
      secondary: const Color(0xFFFF6B6B), // Coral red
      secondaryForeground: const Color(0xFF000000),
      background: const Color(0xFFFFFBEB), // Warm white
      foreground: const Color(0xFF000000),
      card: const Color(0xFFFFFFFF), // Pure white cards
      cardForeground: const Color(0xFF000000),
      muted: const Color(0xFFF5F5F5),
      mutedForeground: const Color(0xFF666666),
      border: const Color(0xFF000000), // Solid black borders
      input: const Color(0xFFFFFFFF),
      ring: const Color(0xFF000000),
      destructive: const Color(0xFFFF4444),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF00D4FF), // Bright cyan
      accentForeground: const Color(0xFF000000),
      chart1: const Color(0xFFFFE600),
      chart2: const Color(0xFFFF6B6B),
      chart3: const Color(0xFF00D4FF),
      chart4: const Color(0xFF9B59B6),
      chart5: const Color(0xFF2ECC71),
      radiusScale: 0.0, // Sharp edges - no rounding
      spacingScale: 1.1,
      shadowIntensity: 2.0,
      fontFamily: 'Inter',
      // Neo-Brutalism specific
      borderWidth: 3.0, // Thick black borders
      enableHardShadow: true, // Hard offset shadow behind cards
      hardShadowOffsetX: 5.0,
      hardShadowOffsetY: 5.0,
    );
  }

  /// Monochrome/Wireframe theme - black and white blueprint look
  static GlobalTheme monochrome() {
    return GlobalTheme(
      primary: const Color(0xFF000000),
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFFFFFFFF),
      secondaryForeground: const Color(0xFF000000),
      background: const Color(0xFFFFFFFF),
      foreground: const Color(0xFF000000),
      card: const Color(0xFFFFFFFF),
      cardForeground: const Color(0xFF000000),
      muted: const Color(0xFFF0F0F0),
      mutedForeground: const Color(0xFF666666),
      border: const Color(0xFF000000),
      input: const Color(0xFFFFFFFF),
      ring: const Color(0xFF000000),
      destructive: const Color(0xFF000000),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF000000),
      accentForeground: const Color(0xFFFFFFFF),
      radiusScale: 0.3,
      fontFamily: 'Courier New',
      borderWidth: 2.0,
    );
  }

  /// Retro Windows theme - Win95 beveled edges, grey backgrounds
  static GlobalTheme retroWindows() {
    return GlobalTheme(
      primary: const Color(0xFF000080), // Navy blue title bar
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFFC0C0C0), // Silver/grey
      secondaryForeground: const Color(0xFF000000),
      background: const Color(0xFFC0C0C0), // Grey desktop
      foreground: const Color(0xFF000000),
      card: const Color(0xFFDFDFDF), // Window background
      cardForeground: const Color(0xFF000000),
      muted: const Color(0xFFBFBFBF),
      mutedForeground: const Color(0xFF808080),
      border: const Color(0xFF808080),
      input: const Color(0xFFFFFFFF),
      ring: const Color(0xFF000080),
      destructive: const Color(0xFFFF0000),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF008080), // Teal accent
      accentForeground: const Color(0xFFFFFFFF),
      radiusScale: 0.0, // Sharp corners
      fontFamily: 'Inter', // Fallback to available font
      borderWidth: 2.0,
    );
  }

  /// Bento/Apple-Style theme - squircle cards, soft shadows, iOS look
  static GlobalTheme bento() {
    return GlobalTheme(
      primary: const Color(0xFF007AFF), // iOS blue
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFFF2F2F7), // iOS light grey
      secondaryForeground: const Color(0xFF000000),
      background: const Color(0xFFF2F2F7),
      foreground: const Color(0xFF000000),
      card: const Color(0xFFFFFFFF),
      cardForeground: const Color(0xFF000000),
      muted: const Color(0xFFE5E5EA),
      mutedForeground: const Color(0xFF8E8E93),
      border: const Color(0xFFD1D1D6),
      input: const Color(0xFFFFFFFF),
      ring: const Color(0xFF007AFF),
      destructive: const Color(0xFFFF3B30),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF34C759), // iOS green
      accentForeground: const Color(0xFFFFFFFF),
      radiusScale: 2.5, // Large squircle corners
      shadowIntensity: 0.3, // Soft subtle shadows
      fontFamily: 'SF Pro',
      enableNeumorphism: true,
      neumorphismIntensity: 0.15, // Very subtle soft shadows
    );
  }
}

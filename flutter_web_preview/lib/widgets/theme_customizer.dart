import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_studio/flutter_studio.dart';
import '../models/app_state.dart';
import '../models/global_theme.dart';

class ThemeCustomizer extends StatelessWidget {
  const ThemeCustomizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return DefaultTabController(
          length: 4,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                child: const TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Color(0xFF667eea),
                  labelStyle: TextStyle(fontSize: 12),
                  tabs: [
                    Tab(text: 'Colors'),
                    Tab(text: 'Typography'),
                    Tab(text: 'Other'),
                    Tab(text: 'Effects'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildColorsTab(context, appState),
                    _buildTypographyTab(context, appState),
                    _buildOtherTab(context, appState),
                    _buildEffectsTab(context, appState),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  DropdownMenuItem<String> _buildThemeDropdownItem(String value, String label, List<Color> colors) {
    return DropdownMenuItem(
      value: value,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Color palette circles
          ...colors.map((color) => Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 0.5),
            ),
          )),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildColorsTab(BuildContext context, AppState appState) {
    final theme = appState.globalTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Theme Presets Dropdown
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF0460c6).withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF0460c6).withOpacity(0.2)),
          ),
          child: Row(
            children: [
              const Text(
                'Color Theme: ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0460c6),
                ),
              ),
              Expanded(
                child: DropdownButton<String>(
                  value: null,
                  isExpanded: true,
                  isDense: true,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down, size: 18),
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                  items: [
                    _buildThemeDropdownItem('default', 'Default', const [Color(0xFF6366F1), Color(0xFFF4F4F5), Color(0xFF000000)]),
                    _buildThemeDropdownItem('cyberpunk', 'Cyberpunk', const [Color(0xFF00FF41), Color(0xFFFF00FF), Color(0xFF0D0D0D)]),
                    _buildThemeDropdownItem('netflix', 'Netflix', const [Color(0xFFE50914), Color(0xFF141414), Color(0xFF000000)]),
                    _buildThemeDropdownItem('amazon', 'Amazon', const [Color(0xFFFF9900), Color(0xFF232F3E), Color(0xFFFFFFFF)]),
                    _buildThemeDropdownItem('flipkart', 'Flipkart', const [Color(0xFF2874F0), Color(0xFFFFC107), Color(0xFFF1F3F6)]),
                    _buildThemeDropdownItem('spotify', 'Spotify', const [Color(0xFF1DB954), Color(0xFF191414), Color(0xFF121212)]),
                    _buildThemeDropdownItem('youtube', 'YouTube', const [Color(0xFFFF0000), Color(0xFF0F0F0F), Color(0xFF272727)]),
                    _buildThemeDropdownItem('instagram', 'Instagram', const [Color(0xFFE4405F), Color(0xFF833AB4), Color(0xFFFAFAFA)]),
                    _buildThemeDropdownItem('neobrutalism', 'Neo-Brutalism', const [Color(0xFFFFE600), Color(0xFFFF6B6B), Color(0xFF000000)]),
                    _buildThemeDropdownItem('monochrome', 'Monochrome', const [Color(0xFF000000), Color(0xFFFFFFFF), Color(0xFF666666)]),
                    _buildThemeDropdownItem('retrowindows', 'Retro Win95', const [Color(0xFF000080), Color(0xFFC0C0C0), Color(0xFF008080)]),
                    _buildThemeDropdownItem('bento', 'Bento/iOS', const [Color(0xFF007AFF), Color(0xFFF2F2F7), Color(0xFF34C759)]),
                  ],
                  onChanged: (String? value) {
                    if (value != null) {
                      GlobalTheme newTheme;
                      switch (value) {
                        case 'cyberpunk':
                          newTheme = GlobalTheme.cyberpunk();
                          break;
                        case 'netflix':
                          newTheme = GlobalTheme.netflix();
                          break;
                        case 'amazon':
                          newTheme = GlobalTheme.amazon();
                          break;
                        case 'flipkart':
                          newTheme = GlobalTheme.flipkart();
                          break;
                        case 'spotify':
                          newTheme = GlobalTheme.spotify();
                          break;
                        case 'youtube':
                          newTheme = GlobalTheme.youtube();
                          break;
                        case 'instagram':
                          newTheme = GlobalTheme.instagram();
                          break;
                        case 'neobrutalism':
                          newTheme = GlobalTheme.neoBrutalism();
                          break;
                        case 'monochrome':
                          newTheme = GlobalTheme.monochrome();
                          break;
                        case 'retrowindows':
                          newTheme = GlobalTheme.retroWindows();
                          break;
                        case 'bento':
                          newTheme = GlobalTheme.bento();
                          break;
                        default:
                          newTheme = GlobalTheme();
                      }
                      appState.updateGlobalTheme(newTheme);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 8),
        // Theme Preview Card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.background,
            borderRadius: BorderRadius.circular(12 * theme.radiusScale),
            border: Border.all(color: theme.border, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Theme Preview',
                style: TextStyle(
                  fontSize: 16 * theme.fontSizeScale,
                  fontWeight: FontWeight.bold,
                  color: theme.foreground,
                  fontFamily: theme.fontFamily,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.primary,
                        borderRadius: BorderRadius.circular(
                          8 * theme.radiusScale,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Primary',
                          style: TextStyle(
                            color: theme.primaryForeground,
                            fontFamily: theme.fontFamily,
                            fontSize: 14 * theme.fontSizeScale,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.card,
                        border: Border.all(color: theme.border),
                        borderRadius: BorderRadius.circular(
                          8 * theme.radiusScale,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Card',
                          style: TextStyle(
                            color: theme.cardForeground,
                            fontFamily: theme.fontFamily,
                            fontSize: 14 * theme.fontSizeScale,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Font: ${theme.fontFamily} • Radius: ${(theme.radiusScale * 100).toInt()}% • Size: ${(theme.fontSizeScale * 100).toInt()}%',
                style: TextStyle(fontSize: 11, color: theme.mutedForeground),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 8),
        const Text(
          'Customize Colors',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildColorSection(context, appState, 'Primary Colors', [
          (
            'Primary',
            theme.primary,
            (c) => appState.updateGlobalTheme(theme.copyWith(primary: c)),
          ),
          (
            'Primary Foreground',
            theme.primaryForeground,
            (c) => appState.updateGlobalTheme(
              theme.copyWith(primaryForeground: c),
            ),
          ),
        ]),
        _buildColorSection(context, appState, 'Secondary Colors', [
          (
            'Secondary',
            theme.secondary,
            (c) => appState.updateGlobalTheme(theme.copyWith(secondary: c)),
          ),
          (
            'Secondary Foreground',
            theme.secondaryForeground,
            (c) => appState.updateGlobalTheme(
              theme.copyWith(secondaryForeground: c),
            ),
          ),
        ]),
        _buildColorSection(context, appState, 'Accent Colors', [
          (
            'Accent',
            theme.accent,
            (c) => appState.updateGlobalTheme(theme.copyWith(accent: c)),
          ),
          (
            'Accent Foreground',
            theme.accentForeground,
            (c) =>
                appState.updateGlobalTheme(theme.copyWith(accentForeground: c)),
          ),
        ]),
        _buildColorSection(context, appState, 'Base Colors', [
          (
            'Background',
            theme.background,
            (c) => appState.updateGlobalTheme(theme.copyWith(background: c)),
          ),
          (
            'Foreground',
            theme.foreground,
            (c) => appState.updateGlobalTheme(theme.copyWith(foreground: c)),
          ),
        ]),
        _buildColorSection(context, appState, 'Card Colors', [
          (
            'Card',
            theme.card,
            (c) => appState.updateGlobalTheme(theme.copyWith(card: c)),
          ),
          (
            'Card Foreground',
            theme.cardForeground,
            (c) =>
                appState.updateGlobalTheme(theme.copyWith(cardForeground: c)),
          ),
        ]),
        _buildColorSection(context, appState, 'Popover Colors', [
          (
            'Popover',
            theme.popover,
            (c) => appState.updateGlobalTheme(theme.copyWith(popover: c)),
          ),
          (
            'Popover Foreground',
            theme.popoverForeground,
            (c) => appState.updateGlobalTheme(
              theme.copyWith(popoverForeground: c),
            ),
          ),
        ]),
        _buildColorSection(context, appState, 'Muted Colors', [
          (
            'Muted',
            theme.muted,
            (c) => appState.updateGlobalTheme(theme.copyWith(muted: c)),
          ),
          (
            'Muted Foreground',
            theme.mutedForeground,
            (c) =>
                appState.updateGlobalTheme(theme.copyWith(mutedForeground: c)),
          ),
        ]),
        _buildColorSection(context, appState, 'Destructive Colors', [
          (
            'Destructive',
            theme.destructive,
            (c) => appState.updateGlobalTheme(theme.copyWith(destructive: c)),
          ),
          (
            'Destructive Foreground',
            theme.destructiveForeground,
            (c) => appState.updateGlobalTheme(
              theme.copyWith(destructiveForeground: c),
            ),
          ),
        ]),
        _buildColorSection(context, appState, 'Border & Input Colors', [
          (
            'Border',
            theme.border,
            (c) => appState.updateGlobalTheme(theme.copyWith(border: c)),
          ),
          (
            'Input',
            theme.input,
            (c) => appState.updateGlobalTheme(theme.copyWith(input: c)),
          ),
          (
            'Ring',
            theme.ring,
            (c) => appState.updateGlobalTheme(theme.copyWith(ring: c)),
          ),
        ]),
        _buildColorSection(context, appState, 'Chart Colors', [
          (
            'Chart 1',
            theme.chart1,
            (c) => appState.updateGlobalTheme(theme.copyWith(chart1: c)),
          ),
          (
            'Chart 2',
            theme.chart2,
            (c) => appState.updateGlobalTheme(theme.copyWith(chart2: c)),
          ),
          (
            'Chart 3',
            theme.chart3,
            (c) => appState.updateGlobalTheme(theme.copyWith(chart3: c)),
          ),
          (
            'Chart 4',
            theme.chart4,
            (c) => appState.updateGlobalTheme(theme.copyWith(chart4: c)),
          ),
          (
            'Chart 5',
            theme.chart5,
            (c) => appState.updateGlobalTheme(theme.copyWith(chart5: c)),
          ),
        ]),
      ],
    );
  }

  Widget _buildColorSection(
    BuildContext context,
    AppState appState,
    String title,
    List<(String, Color, ValueChanged<Color>)> colors,
  ) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      initiallyExpanded: title == 'Primary Colors',
      children: colors.map((colorData) {
        final (label, color, onChange) = colorData;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(label, style: const TextStyle(fontSize: 13)),
              ),
              GestureDetector(
                onTap: () => _showColorPicker(context, label, color, onChange),
                child: Container(
                  width: 100,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _colorToHex(color),
                        style: TextStyle(
                          fontSize: 11,
                          color: color.computeLuminance() > 0.5
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTypographyTab(BuildContext context, AppState appState) {
    final theme = appState.globalTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Font Family',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: theme.fontFamily,
            isExpanded: true,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(value: 'Inter', child: Text('Inter')),
              DropdownMenuItem(value: 'Roboto', child: Text('Roboto')),
              DropdownMenuItem(value: 'Poppins', child: Text('Poppins')),
              DropdownMenuItem(value: 'Open Sans', child: Text('Open Sans')),
              DropdownMenuItem(value: 'Lato', child: Text('Lato')),
              DropdownMenuItem(value: 'Montserrat', child: Text('Montserrat')),
              DropdownMenuItem(value: 'Raleway', child: Text('Raleway')),
              DropdownMenuItem(
                value: 'Source Sans Pro',
                child: Text('Source Sans Pro'),
              ),
              DropdownMenuItem(value: 'Ubuntu', child: Text('Ubuntu')),
              DropdownMenuItem(value: 'Nunito', child: Text('Nunito')),
              // Fonts for new themes
              DropdownMenuItem(value: 'Courier New', child: Text('Courier New')),
              DropdownMenuItem(value: 'MS Sans Serif', child: Text('MS Sans Serif')),
              DropdownMenuItem(value: 'SF Pro', child: Text('SF Pro')),
            ],
            onChanged: (value) {
              if (value != null) {
                appState.updateGlobalTheme(theme.copyWith(fontFamily: value));
              }
            },
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Font Size Scale',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              'Small',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Expanded(
              child: CustomSlider(
                value: theme.fontSizeScale,
                min: 0.75,
                max: 1.5,
                divisions: 15,
                label: '${(theme.fontSizeScale * 100).toInt()}%',
                onChanged: (value) {
                  appState.updateGlobalTheme(
                    theme.copyWith(fontSizeScale: value),
                  );
                },
              ),
            ),
            const Text(
              'Large',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Line Height Scale',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              'Tight',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Expanded(
              child: CustomSlider(
                value: theme.lineHeightScale,
                min: 0.8,
                max: 1.6,
                divisions: 16,
                label: '${(theme.lineHeightScale * 100).toInt()}%',
                onChanged: (value) {
                  appState.updateGlobalTheme(
                    theme.copyWith(lineHeightScale: value),
                  );
                },
              ),
            ),
            const Text(
              'Loose',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOtherTab(BuildContext context, AppState appState) {
    final theme = appState.globalTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Border Radius',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              'Sharp',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Expanded(
              child: CustomSlider(
                value: theme.radiusScale,
                min: 0.0,
                max: 2.0,
                divisions: 20,
                label: '${(theme.radiusScale * 100).toInt()}%',
                onChanged: (value) {
                  appState.updateGlobalTheme(
                    theme.copyWith(radiusScale: value),
                  );
                },
              ),
            ),
            const Text(
              'Round',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Spacing Scale',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              'Tight',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Expanded(
              child: CustomSlider(
                value: theme.spacingScale,
                min: 0.5,
                max: 2.0,
                divisions: 15,
                label: '${(theme.spacingScale * 100).toInt()}%',
                onChanged: (value) {
                  appState.updateGlobalTheme(
                    theme.copyWith(spacingScale: value),
                  );
                },
              ),
            ),
            const Text(
              'Loose',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Shadow Intensity',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              'Flat',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Expanded(
              child: CustomSlider(
                value: theme.shadowIntensity,
                min: 0.0,
                max: 2.0,
                divisions: 20,
                label: '${(theme.shadowIntensity * 100).toInt()}%',
                onChanged: (value) {
                  appState.updateGlobalTheme(
                    theme.copyWith(shadowIntensity: value),
                  );
                },
              ),
            ),
            const Text(
              'Deep',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 32),
        ElevatedButton.icon(
          onPressed: () {
            appState.updateGlobalTheme(GlobalTheme());
          },
          icon: const Icon(Icons.refresh, size: 18),
          label: const Text('Reset to Defaults'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade100,
            foregroundColor: Colors.grey.shade700,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildEffectsTab(BuildContext context, AppState appState) {
    final theme = appState.globalTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Glassmorphism
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: theme.enableGlassmorphism 
                ? const Color(0xFF667eea).withOpacity(0.1)
                : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.enableGlassmorphism
                  ? const Color(0xFF667eea).withOpacity(0.3)
                  : Colors.grey.shade200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.blur_on, size: 20, color: Color(0xFF667eea)),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Glassmorphism',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Switch(
                    value: theme.enableGlassmorphism,
                    onChanged: (value) {
                      appState.updateGlobalTheme(
                        theme.copyWith(enableGlassmorphism: value),
                      );
                    },
                    activeColor: const Color(0xFF667eea),
                  ),
                ],
              ),
              if (theme.enableGlassmorphism) ...[
                const SizedBox(height: 12),
                _buildSliderRow(
                  'Blur',
                  theme.glassBlur,
                  1.0,
                  30.0,
                  (v) => appState.updateGlobalTheme(theme.copyWith(glassBlur: v)),
                ),
                const SizedBox(height: 8),
                _buildSliderRow(
                  'Opacity',
                  theme.glassOpacity,
                  0.05,
                  0.5,
                  (v) => appState.updateGlobalTheme(theme.copyWith(glassOpacity: v)),
                ),
              ],
            ],
          ),
        ),

        // Neumorphism
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: theme.enableNeumorphism 
                ? const Color(0xFF667eea).withOpacity(0.1)
                : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.enableNeumorphism
                  ? const Color(0xFF667eea).withOpacity(0.3)
                  : Colors.grey.shade200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.layers, size: 20, color: Color(0xFF667eea)),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Neumorphism',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Switch(
                    value: theme.enableNeumorphism,
                    onChanged: (value) {
                      appState.updateGlobalTheme(
                        theme.copyWith(enableNeumorphism: value),
                      );
                    },
                    activeColor: const Color(0xFF667eea),
                  ),
                ],
              ),
              if (theme.enableNeumorphism) ...[
                const SizedBox(height: 12),
                _buildSliderRow(
                  'Intensity',
                  theme.neumorphismIntensity,
                  0.1,
                  1.0,
                  (v) => appState.updateGlobalTheme(theme.copyWith(neumorphismIntensity: v)),
                ),
              ],
            ],
          ),
        ),

        // Gradients
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: theme.enableGradients 
                ? const Color(0xFF667eea).withOpacity(0.1)
                : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.enableGradients
                  ? const Color(0xFF667eea).withOpacity(0.3)
                  : Colors.grey.shade200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.gradient, size: 20, color: Color(0xFF667eea)),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Gradient Backgrounds',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Switch(
                    value: theme.enableGradients,
                    onChanged: (value) {
                      appState.updateGlobalTheme(
                        theme.copyWith(enableGradients: value),
                      );
                    },
                    activeColor: const Color(0xFF667eea),
                  ),
                ],
              ),
              if (theme.enableGradients) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _showColorPicker(
                          context, 'Gradient Start', theme.gradientStart,
                          (c) => appState.updateGlobalTheme(theme.copyWith(gradientStart: c)),
                        ),
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                            color: theme.gradientStart,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Center(
                            child: Text(
                              'Start',
                              style: TextStyle(
                                fontSize: 11,
                                color: theme.gradientStart.computeLuminance() > 0.5
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _showColorPicker(
                          context, 'Gradient End', theme.gradientEnd,
                          (c) => appState.updateGlobalTheme(theme.copyWith(gradientEnd: c)),
                        ),
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                            color: theme.gradientEnd,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Center(
                            child: Text(
                              'End',
                              style: TextStyle(
                                fontSize: 11,
                                color: theme.gradientEnd.computeLuminance() > 0.5
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _buildSliderRow(
                  'Angle',
                  theme.gradientAngle,
                  0.0,
                  360.0,
                  (v) => appState.updateGlobalTheme(theme.copyWith(gradientAngle: v)),
                  suffix: '°',
                ),
              ],
            ],
          ),
        ),

        // Border Glow
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: theme.enableBorderGlow 
                ? const Color(0xFF667eea).withOpacity(0.1)
                : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.enableBorderGlow
                  ? const Color(0xFF667eea).withOpacity(0.3)
                  : Colors.grey.shade200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.flare, size: 20, color: Color(0xFF667eea)),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Border Glow',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Switch(
                    value: theme.enableBorderGlow,
                    onChanged: (value) {
                      appState.updateGlobalTheme(
                        theme.copyWith(enableBorderGlow: value),
                      );
                    },
                    activeColor: const Color(0xFF667eea),
                  ),
                ],
              ),
              if (theme.enableBorderGlow) ...[
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () => _showColorPicker(
                    context, 'Glow Color', theme.glowColor,
                    (c) => appState.updateGlobalTheme(theme.copyWith(glowColor: c)),
                  ),
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      color: theme.glowColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Center(
                      child: Text(
                        'Glow Color',
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.glowColor.computeLuminance() > 0.5
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                _buildSliderRow(
                  'Intensity',
                  theme.glowIntensity,
                  0.1,
                  1.0,
                  (v) => appState.updateGlobalTheme(theme.copyWith(glowIntensity: v)),
                ),
                const SizedBox(height: 8),
                _buildSliderRow(
                  'Spread',
                  theme.glowSpread,
                  1.0,
                  20.0,
                  (v) => appState.updateGlobalTheme(theme.copyWith(glowSpread: v)),
                ),
              ],
            ],
          ),
        ),

        // Hover Animations
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: theme.enableHoverAnimations 
                ? const Color(0xFF667eea).withOpacity(0.1)
                : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.enableHoverAnimations
                  ? const Color(0xFF667eea).withOpacity(0.3)
                  : Colors.grey.shade200,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.touch_app, size: 20, color: Color(0xFF667eea)),
              const SizedBox(width: 8),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hover Animations',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Scale effect on hover/tap',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Switch(
                value: theme.enableHoverAnimations,
                onChanged: (value) {
                  appState.updateGlobalTheme(
                    theme.copyWith(enableHoverAnimations: value),
                  );
                },
                activeColor: const Color(0xFF667eea),
              ),
            ],
          ),
        ),

        // Reset Effects Button
        ElevatedButton.icon(
          onPressed: () {
            appState.updateGlobalTheme(theme.copyWith(
              enableGlassmorphism: false,
              enableNeumorphism: false,
              enableGradients: false,
              enableBorderGlow: false,
              enableHoverAnimations: false,
            ));
          },
          icon: const Icon(Icons.refresh, size: 18),
          label: const Text('Reset Effects'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade100,
            foregroundColor: Colors.grey.shade700,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildSliderRow(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged, {
    String? suffix,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        Expanded(
          child: Slider(
            value: value.clamp(min, max),
            min: min,
            max: max,
            onChanged: onChanged,
            activeColor: const Color(0xFF667eea),
          ),
        ),
        SizedBox(
          width: 40,
          child: Text(
            '${value.toInt()}${suffix ?? ''}',
            style: const TextStyle(fontSize: 11, color: Colors.grey),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  void _showColorPicker(
    BuildContext context,
    String label,
    Color currentColor,
    ValueChanged<Color> onColorChanged,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Pick $label'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: currentColor,
            onColorChanged: onColorChanged,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }
}

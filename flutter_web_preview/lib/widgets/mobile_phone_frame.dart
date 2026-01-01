import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/app_state.dart';

class MobilePhoneFrame extends StatelessWidget {
  final List<Widget> components;
  final DeviceFrame deviceFrame;

  const MobilePhoneFrame({
    super.key,
    required this.components,
    this.deviceFrame = DeviceFrame.iphone14,
  });

  Map<String, double> get _dimensions {
    switch (deviceFrame) {
      case DeviceFrame.iphone14:
        return {'width': 375, 'height': 667, 'radius': 48};
      case DeviceFrame.pixel7:
        return {'width': 360, 'height': 640, 'radius': 42};
      case DeviceFrame.ipad:
        return {'width': 540, 'height': 720, 'radius': 36};
      case DeviceFrame.tablet:
        return {'width': 600, 'height': 800, 'radius': 24};
    }
  }

  @override
  Widget build(BuildContext context) {
    final dims = _dimensions;
    return Container(
      width: dims['width'],
      height: dims['height'],
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(dims['radius']!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(36),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: Column(
                children: [
                  _buildStatusBar(),
                  Expanded(child: _buildContent()),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 160,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 14,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 128,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          Positioned(
            right: -1,
            top: 96,
            child: Container(
              width: 4,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(2),
                  bottomLeft: Radius.circular(2),
                ),
              ),
            ),
          ),
          Positioned(
            left: -1,
            top: 80,
            child: Container(
              width: 4,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2),
                  bottomRight: Radius.circular(2),
                ),
              ),
            ),
          ),
          Positioned(
            left: -1,
            top: 128,
            child: Container(
              width: 4,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2),
                  bottomRight: Radius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Icon(Icons.signal_cellular_4_bar, size: 14, color: Colors.black),
              SizedBox(width: 4),
              Icon(Icons.wifi, size: 14, color: Colors.black),
              SizedBox(width: 4),
              Icon(Icons.battery_full, size: 14, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        if (components.isEmpty) {
          // Load preset on first render if nothing selected
          if (appState.showPreset) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              appState.loadPreset(PresetType.dashboard);
            });
            return Container(
              color: Colors.grey[100],
              child: const Center(
                child: Text(
                  'Loading preset...',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            );
          }
        }

        Widget? appBar;
        Widget? bottomNav;
        final List<Widget> centerComponents = [];

        for (final component in components) {
          if (component.runtimeType.toString().contains('AppBar')) {
            appBar = component;
          } else if (component.runtimeType.toString().contains('BottomNav')) {
            bottomNav = component;
          } else {
            centerComponents.add(component);
          }
        }

        // Apply GlobalTheme to components
        final theme = appState.globalTheme;

        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: theme.primary,
              onPrimary: theme.primaryForeground,
              secondary: theme.secondary,
              onSecondary: theme.secondaryForeground,
              surface: theme.card,
              onSurface: theme.cardForeground,
              background: theme.background,
              onBackground: theme.foreground,
              error: theme.destructive,
              onError: theme.destructiveForeground,
              outline: theme.border,
              surfaceContainerHighest: theme.muted,
              onSurfaceVariant: theme.mutedForeground,
            ),
            textTheme: Theme.of(context).textTheme.apply(
              fontFamily: _getFontFamily(theme.fontFamily),
              fontSizeFactor: theme.fontSizeScale,
            ),
          ),
          child: DefaultTextStyle(
            style: GoogleFonts.getFont(
              _getFontFamilyName(theme.fontFamily),
              color: theme.foreground,
              fontSize: 14 * theme.fontSizeScale,
            ),
            child: Scaffold(
              backgroundColor: theme.background,
              appBar: appBar != null
                  ? PreferredSize(
                      preferredSize: const Size.fromHeight(56),
                      child: appBar,
                    )
                  : null,
              body: centerComponents.isEmpty
                  ? const Center(
                      child: Text(
                        'Select components from the left panel',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _buildLayoutForPreset(
                          centerComponents,
                          theme,
                          appState.currentPreset ?? PresetType.dashboard,
                        ),
                      ),
                    ),
              bottomNavigationBar: bottomNav,
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildLayoutForPreset(
    List<Widget> components,
    dynamic theme,
    PresetType presetType,
  ) {
    switch (presetType) {
      case PresetType.dashboard:
        return _buildDashboardLayout(components, theme);
      case PresetType.profile:
        return _buildProfileLayout(components, theme);
      case PresetType.feed:
        return _buildFeedLayout(components, theme);
      case PresetType.form:
        return _buildFormLayout(components, theme);
      case PresetType.settings:
        return _buildSettingsLayout(components, theme);
    }
  }

  List<Widget> _buildDashboardLayout(List<Widget> components, dynamic theme) {
    final List<Widget> layout = [];

    final avatars = components
        .where((c) => c.runtimeType.toString().contains('Avatar'))
        .toList();
    final badges = components
        .where((c) => c.runtimeType.toString().contains('Badge'))
        .toList();
    final cards = components
        .where((c) => c.runtimeType.toString().contains('Card'))
        .toList();
    final buttons = components
        .where((c) => c.runtimeType.toString().contains('Button'))
        .toList();
    final alerts = components
        .where((c) => c.runtimeType.toString().contains('Alert'))
        .toList();
    final progress = components
        .where((c) => c.runtimeType.toString().contains('Progress'))
        .toList();
    final textfields = components
        .where((c) => c.runtimeType.toString().contains('TextField'))
        .toList();
    final chips = components
        .where((c) => c.runtimeType.toString().contains('Chip'))
        .toList();
    final switches = components
        .where((c) => c.runtimeType.toString().contains('Switch'))
        .toList();
    final others = components
        .where(
          (c) =>
              !c.runtimeType.toString().contains('Avatar') &&
              !c.runtimeType.toString().contains('Badge') &&
              !c.runtimeType.toString().contains('Card') &&
              !c.runtimeType.toString().contains('Button') &&
              !c.runtimeType.toString().contains('Alert') &&
              !c.runtimeType.toString().contains('Progress') &&
              !c.runtimeType.toString().contains('TextField') &&
              !c.runtimeType.toString().contains('Chip') &&
              !c.runtimeType.toString().contains('Switch'),
        )
        .toList();

    // Header section with avatar and badge
    if (avatars.isNotEmpty || badges.isNotEmpty) {
      layout.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              if (avatars.isNotEmpty) avatars.first,
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tejas S',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: theme.foreground,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (badges.isNotEmpty) badges.first,
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Search bar
    if (textfields.isNotEmpty) {
      layout.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: textfields.first,
        ),
      );
    }

    // Filter chips
    if (chips.isNotEmpty) {
      layout.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: chips
                  .take(3)
                  .map(
                    (chip) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: chip,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
    }

    // Alerts section
    if (alerts.isNotEmpty) {
      for (var alert in alerts) {
        layout.add(
          Padding(padding: const EdgeInsets.only(bottom: 16), child: alert),
        );
      }
    }

    // Stats cards section header
    if (cards.isNotEmpty) {
      layout.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            'Overview',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: theme.foreground,
            ),
          ),
        ),
      );

      layout.add(
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.3,
          children: cards.take(4).toList(),
        ),
      );
      layout.add(const SizedBox(height: 16));
    }

    // Progress section
    if (progress.isNotEmpty) {
      layout.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            'Activity',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: theme.foreground,
            ),
          ),
        ),
      );
      layout.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: progress,
          ),
        ),
      );
    }

    // Settings section with switches
    if (switches.isNotEmpty) {
      layout.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            'Quick Settings',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: theme.foreground,
            ),
          ),
        ),
      );
      for (var sw in switches) {
        layout.add(
          Padding(padding: const EdgeInsets.only(bottom: 8), child: sw),
        );
      }
      layout.add(const SizedBox(height: 16));
    }

    // Action buttons
    if (buttons.isNotEmpty) {
      layout.add(
        Row(
          children: buttons
              .take(2)
              .map(
                (btn) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: btn,
                  ),
                ),
              )
              .toList(),
        ),
      );
      layout.add(const SizedBox(height: 16));
    }

    // Other components
    if (others.isNotEmpty) {
      layout.add(Wrap(spacing: 16, runSpacing: 16, children: others));
    }

    return layout;
  }

  List<Widget> _buildProfileLayout(List<Widget> components, dynamic theme) {
    final List<Widget> layout = [];

    final avatars = components
        .where((c) => c.runtimeType.toString().contains('Avatar'))
        .toList();
    final badges = components
        .where((c) => c.runtimeType.toString().contains('Badge'))
        .toList();
    final cards = components
        .where((c) => c.runtimeType.toString().contains('Card'))
        .toList();
    final buttons = components
        .where((c) => c.runtimeType.toString().contains('Button'))
        .toList();
    final textfields = components
        .where((c) => c.runtimeType.toString().contains('TextField'))
        .toList();
    final chips = components
        .where((c) => c.runtimeType.toString().contains('Chip'))
        .toList();
    final dividers = components
        .where((c) => c.runtimeType.toString().contains('Divider'))
        .toList();
    final switches = components
        .where((c) => c.runtimeType.toString().contains('Switch'))
        .toList();

    // Profile header - centered avatar with badge
    if (avatars.isNotEmpty) {
      layout.add(
        Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              avatars.first,
              const SizedBox(height: 12),
              Text(
                'Tejas S',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: theme.foreground,
                ),
              ),
              const SizedBox(height: 4),
              if (badges.isNotEmpty) badges.first,
              const SizedBox(height: 24),
            ],
          ),
        ),
      );
    }

    // Stats cards
    if (cards.isNotEmpty) {
      layout.add(
        Row(
          children: cards
              .take(2)
              .map(
                (card) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: card,
                  ),
                ),
              )
              .toList(),
        ),
      );
      layout.add(const SizedBox(height: 16));
    }

    if (dividers.isNotEmpty) layout.add(dividers.first);

    // Bio section
    if (textfields.isNotEmpty) {
      layout.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: textfields.first,
        ),
      );
    }

    // Interest chips
    if (chips.isNotEmpty) {
      layout.add(
        Text(
          'Interests',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: theme.foreground,
          ),
        ),
      );
      layout.add(const SizedBox(height: 12));
      layout.add(
        Wrap(spacing: 8, runSpacing: 8, children: chips.take(4).toList()),
      );
      layout.add(const SizedBox(height: 16));
    }

    if (dividers.length > 1) layout.add(dividers[1]);

    // Settings
    if (switches.isNotEmpty) {
      layout.add(const SizedBox(height: 16));
      for (var sw in switches) {
        layout.add(
          Padding(padding: const EdgeInsets.only(bottom: 8), child: sw),
        );
      }
    }

    // Action button
    if (buttons.isNotEmpty) {
      layout.add(const SizedBox(height: 24));
      layout.add(Center(child: buttons.first));
    }

    return layout;
  }

  List<Widget> _buildFeedLayout(List<Widget> components, dynamic theme) {
    final List<Widget> layout = [];

    final textfields = components
        .where((c) => c.runtimeType.toString().contains('TextField'))
        .toList();
    final chips = components
        .where((c) => c.runtimeType.toString().contains('Chip'))
        .toList();
    final cards = components
        .where((c) => c.runtimeType.toString().contains('Card'))
        .toList();
    final avatars = components
        .where((c) => c.runtimeType.toString().contains('Avatar'))
        .toList();
    final badges = components
        .where((c) => c.runtimeType.toString().contains('Badge'))
        .toList();
    final buttons = components
        .where((c) => c.runtimeType.toString().contains('Button'))
        .toList();
    final dividers = components
        .where((c) => c.runtimeType.toString().contains('Divider'))
        .toList();

    // Search bar
    if (textfields.isNotEmpty) {
      layout.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: textfields.first,
        ),
      );
    }

    // Filter chips
    if (chips.isNotEmpty) {
      layout.add(
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: chips
                .take(4)
                .map(
                  (chip) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: chip,
                  ),
                )
                .toList(),
          ),
        ),
      );
      layout.add(const SizedBox(height: 16));
    }

    // Feed posts (cards with avatar and actions)
    for (int i = 0; i < cards.length && i < 3; i++) {
      layout.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (avatars.isNotEmpty)
              Row(
                children: [
                  avatars.first,
                  const SizedBox(width: 8),
                  Text(
                    'User ${i + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: theme.foreground,
                    ),
                  ),
                  const Spacer(),
                  if (badges.isNotEmpty && i == 0) badges.first,
                ],
              ),
            const SizedBox(height: 8),
            cards[i],
            const SizedBox(height: 8),
            if (buttons.isNotEmpty)
              Row(
                children: buttons
                    .take(2)
                    .map(
                      (btn) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: btn,
                      ),
                    )
                    .toList(),
              ),
            if (dividers.isNotEmpty) ...[
              const SizedBox(height: 16),
              dividers.first,
              const SizedBox(height: 16),
            ] else
              const SizedBox(height: 24),
          ],
        ),
      );
    }

    return layout;
  }

  List<Widget> _buildFormLayout(List<Widget> components, dynamic theme) {
    final List<Widget> layout = [];

    final textfields = components
        .where((c) => c.runtimeType.toString().contains('TextField'))
        .toList();
    final dropdowns = components
        .where((c) => c.runtimeType.toString().contains('Dropdown'))
        .toList();
    final checkboxes = components
        .where((c) => c.runtimeType.toString().contains('Checkbox'))
        .toList();
    final radios = components
        .where((c) => c.runtimeType.toString().contains('Radio'))
        .toList();
    final sliders = components
        .where((c) => c.runtimeType.toString().contains('Slider'))
        .toList();
    final switches = components
        .where((c) => c.runtimeType.toString().contains('Switch'))
        .toList();
    final buttons = components
        .where((c) => c.runtimeType.toString().contains('Button'))
        .toList();
    final alerts = components
        .where((c) => c.runtimeType.toString().contains('Alert'))
        .toList();

    // Alert at top
    if (alerts.isNotEmpty) {
      layout.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: alerts.first,
        ),
      );
    }

    // Text inputs
    for (var field in textfields) {
      layout.add(
        Padding(padding: const EdgeInsets.only(bottom: 16), child: field),
      );
    }

    // Dropdowns
    for (var dropdown in dropdowns) {
      layout.add(
        Padding(padding: const EdgeInsets.only(bottom: 16), child: dropdown),
      );
    }

    // Radios
    if (radios.isNotEmpty) {
      layout.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 8),
          child: Text(
            'Preferences',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: theme.foreground,
            ),
          ),
        ),
      );
      for (var radio in radios) {
        layout.add(
          Padding(padding: const EdgeInsets.only(bottom: 8), child: radio),
        );
      }
      layout.add(const SizedBox(height: 16));
    }

    // Checkboxes
    for (var checkbox in checkboxes) {
      layout.add(
        Padding(padding: const EdgeInsets.only(bottom: 8), child: checkbox),
      );
    }

    // Sliders
    for (var slider in sliders) {
      layout.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: slider,
        ),
      );
    }

    // Switches
    for (var sw in switches) {
      layout.add(Padding(padding: const EdgeInsets.only(bottom: 8), child: sw));
    }

    // Submit button
    if (buttons.isNotEmpty) {
      layout.add(const SizedBox(height: 24));
      layout.add(
        Center(
          child: SizedBox(width: double.infinity, child: buttons.first),
        ),
      );
    }

    return layout;
  }

  List<Widget> _buildSettingsLayout(List<Widget> components, dynamic theme) {
    final List<Widget> layout = [];

    final avatars = components
        .where((c) => c.runtimeType.toString().contains('Avatar'))
        .toList();
    final cards = components
        .where((c) => c.runtimeType.toString().contains('Card'))
        .toList();
    final switches = components
        .where((c) => c.runtimeType.toString().contains('Switch'))
        .toList();
    final sliders = components
        .where((c) => c.runtimeType.toString().contains('Slider'))
        .toList();
    final radios = components
        .where((c) => c.runtimeType.toString().contains('Radio'))
        .toList();
    final checkboxes = components
        .where((c) => c.runtimeType.toString().contains('Checkbox'))
        .toList();
    final dividers = components
        .where((c) => c.runtimeType.toString().contains('Divider'))
        .toList();
    final buttons = components
        .where((c) => c.runtimeType.toString().contains('Button'))
        .toList();
    final alerts = components
        .where((c) => c.runtimeType.toString().contains('Alert'))
        .toList();

    // Profile section
    if (avatars.isNotEmpty) {
      layout.add(
        Row(
          children: [
            avatars.first,
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tejas S',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: theme.foreground,
                    ),
                  ),
                  Text(
                    'tejas@example.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      layout.add(const SizedBox(height: 24));
    }

    // Settings cards
    if (cards.isNotEmpty) {
      layout.add(
        Text(
          'Preferences',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: theme.foreground,
          ),
        ),
      );
      layout.add(const SizedBox(height: 12));
      for (var card in cards) {
        layout.add(
          Padding(padding: const EdgeInsets.only(bottom: 12), child: card),
        );
      }
      layout.add(const SizedBox(height: 16));
    }

    if (dividers.isNotEmpty) layout.add(dividers.first);

    // Toggle settings
    if (switches.isNotEmpty || checkboxes.isNotEmpty) {
      layout.add(const SizedBox(height: 16));
      layout.add(
        Text(
          'Notifications',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: theme.foreground,
          ),
        ),
      );
      layout.add(const SizedBox(height: 12));

      for (var sw in switches) {
        layout.add(
          Padding(padding: const EdgeInsets.only(bottom: 8), child: sw),
        );
      }
      for (var checkbox in checkboxes) {
        layout.add(
          Padding(padding: const EdgeInsets.only(bottom: 8), child: checkbox),
        );
      }
      layout.add(const SizedBox(height: 16));
    }

    if (dividers.length > 1) layout.add(dividers[1]);

    // Appearance settings
    if (sliders.isNotEmpty || radios.isNotEmpty) {
      layout.add(const SizedBox(height: 16));
      layout.add(
        Text(
          'Appearance',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: theme.foreground,
          ),
        ),
      );
      layout.add(const SizedBox(height: 12));

      for (var radio in radios) {
        layout.add(
          Padding(padding: const EdgeInsets.only(bottom: 8), child: radio),
        );
      }
      for (var slider in sliders) {
        layout.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: slider,
          ),
        );
      }
    }

    // Info alert
    if (alerts.isNotEmpty) {
      layout.add(const SizedBox(height: 16));
      layout.add(alerts.first);
    }

    // Save button
    if (buttons.isNotEmpty) {
      layout.add(const SizedBox(height: 24));
      layout.add(
        Center(
          child: SizedBox(width: double.infinity, child: buttons.first),
        ),
      );
    }

    return layout;
  }

  String _getFontFamilyName(String fontFamily) {
    // Map theme font names to Google Fonts names
    final fontMap = {
      'Inter': 'Inter',
      'Roboto': 'Roboto',
      'Poppins': 'Poppins',
      'Open Sans': 'Open Sans',
      'Lato': 'Lato',
      'Montserrat': 'Montserrat',
      'Raleway': 'Raleway',
      'Source Sans Pro': 'Source Sans 3',
      'Ubuntu': 'Ubuntu',
      'Nunito': 'Nunito',
    };
    return fontMap[fontFamily] ?? 'Inter';
  }

  String _getFontFamily(String fontFamily) {
    return GoogleFonts.getFont(_getFontFamilyName(fontFamily)).fontFamily ??
        fontFamily;
  }
}

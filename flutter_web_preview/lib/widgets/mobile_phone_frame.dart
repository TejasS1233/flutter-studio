import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/app_state.dart';
import '../models/component_config.dart';

class MobilePhoneFrame extends StatelessWidget {
  final List<Widget> components;
  final DeviceFrame deviceFrame;
  final bool fillAvailableSpace;

  const MobilePhoneFrame({
    super.key,
    required this.components,
    this.deviceFrame = DeviceFrame.iphone14,
    this.fillAvailableSpace = false,
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
    
    Widget phoneFrame = Container(
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
    
    // When fillAvailableSpace is true, use FittedBox to scale the frame
    if (fillAvailableSpace) {
      return FittedBox(
        fit: BoxFit.contain,
        child: phoneFrame,
      );
    }
    
    return phoneFrame;
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

        final theme = appState.globalTheme;

        final appBarConfig = appState.selectedComponents
            .where((c) => c.id == 'appbar')
            .firstOrNull;
        final bottomNavConfig = appState.selectedComponents
            .where((c) => c.id == 'bottomnav')
            .firstOrNull;

        final appBar = appBarConfig?.buildWidget(theme: theme);
        final bottomNav = bottomNavConfig?.buildWidget(theme: theme);

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
            child: Container(
              decoration: theme.enableGradients
                  ? BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [theme.gradientStart, theme.gradientEnd],
                      ),
                    )
                  : null,
              child: Scaffold(
                backgroundColor: theme.enableGradients ? Colors.transparent : theme.background,
                appBar: appBar != null
                    ? PreferredSize(
                        preferredSize: const Size.fromHeight(56),
                        child: appBar,
                      )
                    : null,
                body:
                    appState.selectedComponents
                        .where((c) => c.id != 'appbar' && c.id != 'bottomnav')
                        .isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            appState.selectedComponents.isEmpty
                                ? 'Select components from the left panel'
                                : 'Add more components to see them here',
                            style: const TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildLayoutForPreset(
                            appState.selectedComponents
                                .where(
                                  (c) => c.id != 'appbar' && c.id != 'bottomnav',
                                )
                                .toList(),
                            theme,
                            appState.currentPreset ?? PresetType.dashboard,
                          ),
                        ),
                      ),
                bottomNavigationBar: bottomNav,
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildLayoutForPreset(
    List<ComponentConfig> components,
    dynamic theme,
    PresetType presetType,
  ) {
    print(
      'Building layout for $presetType with ${components.length} components',
    );
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

  Widget _buildStatCard(dynamic theme, String title, String value, String change, IconData icon, bool isPositive) {
    // Safe access with defaults - old theme instances may not have these properties
    double borderWidth = 1.0;
    bool enableHardShadow = false;
    double hardShadowOffsetX = 4.0;
    double hardShadowOffsetY = 4.0;
    
    try { borderWidth = theme.borderWidth ?? 1.0; } catch (_) {}
    try { enableHardShadow = theme.enableHardShadow ?? false; } catch (_) {}
    try { hardShadowOffsetX = theme.hardShadowOffsetX ?? 4.0; } catch (_) {}
    try { hardShadowOffsetY = theme.hardShadowOffsetY ?? 4.0; } catch (_) {}
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.card,
        borderRadius: BorderRadius.circular(12.0 * (theme.radiusScale as double)),
        border: Border.all(
          color: theme.border,
          width: borderWidth,
        ),
        // Hard offset shadow for brutalism
        boxShadow: enableHardShadow
            ? [
                BoxShadow(
                  color: theme.border,
                  offset: Offset(hardShadowOffsetX, hardShadowOffsetY),
                  blurRadius: 0, // No blur - hard shadow
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 11,
                  color: theme.mutedForeground,
                ),
              ),
              Icon(icon, size: 16, color: theme.mutedForeground),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: theme.foreground,
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: (isPositive ? Colors.green : Colors.red).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  change,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: isPositive ? Colors.green : Colors.red,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'vs last week',
                style: TextStyle(
                  fontSize: 9,
                  color: theme.mutedForeground,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(dynamic theme, String title, String subtitle, String amount, IconData icon, bool isIncome) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.muted,
              borderRadius: BorderRadius.circular(8.0 * (theme.radiusScale as double)),
            ),
            child: Icon(icon, size: 20, color: theme.foreground),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: theme.foreground,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isIncome ? Colors.green : theme.foreground,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDashboardLayout(
    List<ComponentConfig> components,
    dynamic theme,
  ) {
    final List<Widget> layout = [];

    final avatars = components
        .where((c) => c.id == 'avatar')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final badges = components
        .where((c) => c.id == 'badge')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final cards = components
        .where((c) => c.id == 'card')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final buttons = components
        .where((c) => c.id == 'button')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final alerts = components
        .where((c) => c.id == 'alert')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final progress = components
        .where((c) => c.id == 'progress')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final textfields = components
        .where((c) => c.id == 'textfield')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final chips = components
        .where((c) => c.id == 'chip')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final switches = components
        .where((c) => c.id == 'switch')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final others = components
        .where(
          (c) => ![
            'avatar',
            'badge',
            'card',
            'button',
            'alert',
            'progress',
            'textfield',
            'chip',
            'switch',
          ].contains(c.id),
        )
        .map((c) => c.buildWidget(theme: theme))
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

    // Notification card (using alert)
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Overview',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: theme.foreground,
                ),
              ),
              Text(
                'This week',
                style: TextStyle(
                  fontSize: 12,
                  color: theme.mutedForeground,
                ),
              ),
            ],
          ),
        ),
      );

      // Realistic stats cards
      layout.add(
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.4,
          children: [
            _buildStatCard(theme, 'Total Revenue', '\$24,780', '+12.5%', Icons.trending_up, true),
            _buildStatCard(theme, 'Active Users', '1,429', '+8.2%', Icons.people_outline, true),
            _buildStatCard(theme, 'Orders', '356', '-3.1%', Icons.shopping_bag_outlined, false),
            _buildStatCard(theme, 'Conversion', '4.3%', '+0.8%', Icons.auto_graph, true),
          ],
        ),
      );
      layout.add(const SizedBox(height: 16));
    }

    // Recent Activity section
    layout.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.foreground,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                fontSize: 12,
                color: theme.primary,
              ),
            ),
          ],
        ),
      ),
    );
    
    // Recent activity items
    layout.add(
      Column(
        children: [
          _buildActivityItem(theme, 'Payment Received', 'From John Doe', '+\$450.00', Icons.arrow_downward, true),
          _buildActivityItem(theme, 'Subscription', 'Netflix Monthly', '-\$15.99', Icons.subscriptions_outlined, false),
          _buildActivityItem(theme, 'Transfer', 'To Savings Account', '-\$200.00', Icons.swap_horiz, false),
        ],
      ),
    );
    layout.add(const SizedBox(height: 16));

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
      layout.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: others
              .map(
                (other) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: other,
                ),
              )
              .toList(),
        ),
      );
    }

    return layout;
  }

  List<Widget> _buildProfileLayout(
    List<ComponentConfig> components,
    dynamic theme,
  ) {
    final List<Widget> layout = [];

    final avatars = components
        .where((c) => c.id == 'avatar')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final badges = components
        .where((c) => c.id == 'badge')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final cards = components
        .where((c) => c.id == 'card')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final buttons = components
        .where((c) => c.id == 'button')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final textfields = components
        .where((c) => c.id == 'textfield')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final chips = components
        .where((c) => c.id == 'chip')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final dividers = components
        .where((c) => c.id == 'divider')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final switches = components
        .where((c) => c.id == 'switch')
        .map((c) => c.buildWidget(theme: theme))
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

    // Other components
    final others = components
        .where(
          (c) => ![
            'avatar',
            'badge',
            'card',
            'button',
            'textfield',
            'chip',
            'divider',
            'switch',
          ].contains(c.id),
        )
        .map((c) => c.buildWidget(theme: theme))
        .toList();

    if (others.isNotEmpty) {
      layout.add(const SizedBox(height: 16));
      layout.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: others
              .map(
                (other) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: other,
                ),
              )
              .toList(),
        ),
      );
    }

    return layout;
  }

  List<Widget> _buildFeedLayout(
    List<ComponentConfig> components,
    dynamic theme,
  ) {
    final List<Widget> layout = [];

    final textfields = components
        .where((c) => c.id == 'textfield')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final chips = components
        .where((c) => c.id == 'chip')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final cards = components
        .where((c) => c.id == 'card')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final avatars = components
        .where((c) => c.id == 'avatar')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final badges = components
        .where((c) => c.id == 'badge')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final buttons = components
        .where((c) => c.id == 'button')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final dividers = components
        .where((c) => c.id == 'divider')
        .map((c) => c.buildWidget(theme: theme))
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

    // Other components
    final others = components
        .where(
          (c) => ![
            'textfield',
            'chip',
            'card',
            'avatar',
            'badge',
            'button',
            'divider',
          ].contains(c.id),
        )
        .map((c) => c.buildWidget(theme: theme))
        .toList();

    if (others.isNotEmpty) {
      layout.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: others
              .map(
                (other) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: other,
                ),
              )
              .toList(),
        ),
      );
    }

    return layout;
  }

  List<Widget> _buildFormLayout(
    List<ComponentConfig> components,
    dynamic theme,
  ) {
    final List<Widget> layout = [];

    final textfields = components
        .where((c) => c.id == 'textfield')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final dropdowns = components
        .where((c) => c.id == 'dropdown')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final checkboxes = components
        .where((c) => c.id == 'checkbox')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final radios = components
        .where((c) => c.id == 'radio')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final sliders = components
        .where((c) => c.id == 'slider')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final switches = components
        .where((c) => c.id == 'switch')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final buttons = components
        .where((c) => c.id == 'button')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final alerts = components
        .where((c) => c.id == 'alert')
        .map((c) => c.buildWidget(theme: theme))
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

    // Other components
    final others = components
        .where(
          (c) => ![
            'textfield',
            'dropdown',
            'checkbox',
            'radio',
            'slider',
            'switch',
            'button',
            'alert',
          ].contains(c.id),
        )
        .map((c) => c.buildWidget(theme: theme))
        .toList();

    if (others.isNotEmpty) {
      layout.add(const SizedBox(height: 16));
      layout.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: others
              .map(
                (other) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: other,
                ),
              )
              .toList(),
        ),
      );
    }

    return layout;
  }

  List<Widget> _buildSettingsLayout(
    List<ComponentConfig> components,
    dynamic theme,
  ) {
    final List<Widget> layout = [];

    final avatars = components
        .where((c) => c.id == 'avatar')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final cards = components
        .where((c) => c.id == 'card')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final switches = components
        .where((c) => c.id == 'switch')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final sliders = components
        .where((c) => c.id == 'slider')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final radios = components
        .where((c) => c.id == 'radio')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final checkboxes = components
        .where((c) => c.id == 'checkbox')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final dividers = components
        .where((c) => c.id == 'divider')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final buttons = components
        .where((c) => c.id == 'button')
        .map((c) => c.buildWidget(theme: theme))
        .toList();
    final alerts = components
        .where((c) => c.id == 'alert')
        .map((c) => c.buildWidget(theme: theme))
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

    // Other components
    final others = components
        .where(
          (c) => ![
            'avatar',
            'card',
            'switch',
            'slider',
            'radio',
            'checkbox',
            'divider',
            'button',
            'alert',
          ].contains(c.id),
        )
        .map((c) => c.buildWidget(theme: theme))
        .toList();

    if (others.isNotEmpty) {
      layout.add(const SizedBox(height: 16));
      layout.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: others
              .map(
                (other) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: other,
                ),
              )
              .toList(),
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

import 'package:flutter/material.dart';
import 'package:flutter_studio/flutter_studio.dart';
import '../models/global_theme.dart';
import '../widgets/visual_effects.dart';

class ComponentConfig {
  final String id;
  final String name;
  final String displayName;
  final IconData icon;
  bool isSelected;
  Map<String, dynamic> properties;

  ComponentConfig({
    required this.id,
    required this.name,
    required this.displayName,
    required this.icon,
    this.isSelected = false,
    required this.properties,
  });

  /// Build the actual Flutter widget with current properties and global theme
  Widget buildWidget({GlobalTheme? theme}) {
    final t = theme ?? GlobalTheme(); // Fallback to defaults

    // Helper to wrap container-like widgets with visual effects
    Widget wrapWithEffects(Widget child, {double? width, double? height, EdgeInsets? padding, double? borderRadius}) {
      // Only glass, neum, glow apply to components - gradients are app-level
      final hasEffects = t.enableGlassmorphism || t.enableNeumorphism || t.enableBorderGlow;
      if (!hasEffects) return child;
      
      return EffectContainer(
        theme: t,
        backgroundColor: Colors.transparent, // Don't add extra background
        borderRadius: BorderRadius.circular((borderRadius ?? 12.0) * t.radiusScale),
        padding: padding,
        child: SizedBox(
          width: width != null ? width - (padding?.horizontal ?? 0) : null,
          height: height != null ? height - (padding?.vertical ?? 0) : null,
          child: child,
        ),
      );
    }

    switch (id) {
      case 'button':
        return wrapWithEffects(
          CustomButton(
            text: properties['text'] ?? 'Click Me',
            variant: _getButtonVariant(properties['variant']),
            size: _getButtonSize(properties['size']),
            backgroundColor: properties['backgroundColor'] ?? t.primary,
            textColor: properties['textColor'] ?? t.primaryForeground,
            borderColor: properties['borderColor'] ?? t.border,
            borderRadius:
                (properties['borderRadius']?.toDouble() ?? 8.0) * t.radiusScale,
            elevation:
                (properties['elevation']?.toDouble() ?? 2.0) * t.shadowIntensity,
            fullWidth: properties['fullWidth'] ?? false,
            fontSize:
                (properties['fontSize']?.toDouble() ?? 16.0) * t.fontSizeScale,
            icon: properties['icon'] != 'none'
                ? _getIcon(properties['icon'])
                : null,
            onPressed: () {},
          ),
          borderRadius: 8.0,
        );

      case 'card':
        final cardWidget = CustomCard(
          variant: _getCardVariant(properties['variant']),
          backgroundColor: t.enableGlassmorphism ? t.card.withOpacity(t.glassOpacity) : (properties['backgroundColor'] ?? t.card),
          borderColor: properties['borderColor'] ?? t.border,
          borderRadius:
              (properties['borderRadius']?.toDouble() ?? 12.0) * t.radiusScale,
          padding: EdgeInsets.all(
            (properties['padding']?.toDouble() ?? 16.0) * t.spacingScale,
          ),
          elevation: t.enableNeumorphism ? 0 : 
              (properties['elevation']?.toDouble() ?? 2.0) * t.shadowIntensity,
          borderWidth: properties['borderWidth']?.toDouble() ?? 1.0,
          width: properties['width']?.toDouble() ?? 300.0,
          height: properties['height']?.toDouble() ?? 200.0,
          child: Center(
            child: Text(
              'Card Content',
              style: TextStyle(color: t.cardForeground),
            ),
          ),
        );
        
        // Apply visual effects if any are enabled (gradients are app-level only)
        if (t.enableGlassmorphism || t.enableNeumorphism || t.enableBorderGlow) {
          return EffectContainer(
            theme: t,
            backgroundColor: properties['backgroundColor'] ?? t.card,
            borderRadius: BorderRadius.circular(
              (properties['borderRadius']?.toDouble() ?? 12.0) * t.radiusScale,
            ),
            padding: EdgeInsets.all(
              (properties['padding']?.toDouble() ?? 16.0) * t.spacingScale,
            ),
            child: SizedBox(
              width: (properties['width']?.toDouble() ?? 300.0) - 32,
              height: (properties['height']?.toDouble() ?? 200.0) - 32,
              child: Center(
                child: Text(
                  'Card Content',
                  style: TextStyle(color: t.cardForeground),
                ),
              ),
            ),
          );
        }
        return cardWidget;

      case 'textfield':
        return wrapWithEffects(
          CustomTextField(
            label: properties['label'] ?? 'Email',
            placeholder: properties['placeholder'] ?? 'Enter your email',
            size: _getTextFieldSize(properties['size']),
            backgroundColor: properties['backgroundColor'] ?? t.background,
            borderColor: properties['borderColor'] ?? t.input,
            focusedBorderColor: properties['focusedBorderColor'] ?? t.ring,
            textColor: properties['textColor'] ?? t.foreground,
            labelColor: properties['labelColor'] ?? t.mutedForeground,
            borderRadius:
                (properties['borderRadius']?.toDouble() ?? 8.0) * t.radiusScale,
            borderWidth: properties['borderWidth']?.toDouble() ?? 1.5,
            fontSize:
                (properties['fontSize']?.toDouble() ?? 16.0) * t.fontSizeScale,
            prefixIcon: properties['prefixIcon'] != 'none'
                ? _getIcon(properties['prefixIcon'])
                : null,
          ),
          borderRadius: 8.0,
        );

      case 'appbar':
        // More realistic app bar with icons
        return Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          color: properties['backgroundColor'] ?? t.primary,
          child: Row(
            children: [
              Icon(
                Icons.menu,
                color: properties['textColor'] ?? t.primaryForeground,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  properties['title'] ?? 'Dashboard',
                  style: TextStyle(
                    color: properties['textColor'] ?? t.primaryForeground,
                    fontSize: (properties['fontSize']?.toDouble() ?? 18.0) * t.fontSizeScale,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Notification icon with badge
              Stack(
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    color: properties['textColor'] ?? t.primaryForeground,
                    size: 24,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: t.primary, width: 1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.settings_outlined,
                color: properties['textColor'] ?? t.primaryForeground,
                size: 22,
              ),
            ],
          ),
        );

      case 'bottomnav':
        return CustomBottomNavBar(
          currentIndex: 0,
          size: _getBottomNavSize(properties['size']),
          backgroundColor: t.card,
          selectedItemColor: t.primary,
          unselectedItemColor: t.mutedForeground,
          elevation: 0, // Remove shadow line
          iconSize:
              (properties['iconSize']?.toDouble() ?? 24.0) * t.fontSizeScale,
          fontSize:
              (properties['fontSize']?.toDouble() ?? 14.0) * t.fontSizeScale,
          showLabels: properties['showLabels'] ?? true,
          items: const [
            CustomBottomNavItem(icon: Icons.home, label: 'Home'),
            CustomBottomNavItem(icon: Icons.search, label: 'Search'),
            CustomBottomNavItem(icon: Icons.person, label: 'Profile'),
          ],
          onTap: (index) {},
        );

      case 'badge':
        final badgeRadius = 16.0 * t.radiusScale + 2;
        return wrapWithEffects(
          CustomBadge(
            text: properties['text'] ?? 'New',
            variant: _getBadgeVariant(properties['variant']),
            backgroundColor: t.primary,
            foregroundColor: t.primaryForeground,
            borderRadius: badgeRadius, // Pass to badge component
          ),
          borderRadius: badgeRadius,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        );

      case 'checkbox':
        return CustomCheckbox(
          value: properties['value'] ?? true,
          label: properties['label'],
        );

      case 'radio':
        return CustomRadio<String>(
          value: 'option1',
          groupValue: 'option1',
          label: properties['label'] ?? 'Option',
        );

      case 'switch':
        return CustomSwitch(
          value: properties['value'] ?? true,
          label: properties['label'],
          activeColor: t.primary,
          inactiveColor: t.input,
        );

      case 'slider':
        return CustomSlider(
          value: properties['value']?.toDouble() ?? 0.5,
          min: properties['min']?.toDouble() ?? 0.0,
          max: properties['max']?.toDouble() ?? 1.0,
          label: properties['label'],
        );

      case 'avatar':
        // Respect theme radiusScale - low values = more square, high values = circular
        return CustomAvatar(
          initials: properties['initials'] ?? 'JD',
          size: _getAvatarSize(properties['size']),
          borderRadius: t.radiusScale < 0.5 ? 8.0 * t.radiusScale + 4 : null, // null = full circle
        );

      case 'alert':
        final alertRadius = 8.0 * t.radiusScale + 2;
        return wrapWithEffects(
          CustomAlert(
            title: properties['title'] ?? 'Alert',
            description: properties['description'],
            variant: _getAlertVariant(properties['variant']),
            borderRadius: alertRadius, // Pass to component
          ),
          borderRadius: alertRadius,
          padding: const EdgeInsets.all(12),
        );

      case 'divider':
        return const CustomDivider();

      case 'chip':
        final chipRadius = 16.0 * t.radiusScale + 2;
        return wrapWithEffects(
          CustomChip(
            label: properties['label'] ?? 'Chip',
            borderRadius: chipRadius, // Pass to component
          ),
          borderRadius: chipRadius,
        );

      case 'progress':
        return CustomProgress(
          value: properties['value']?.toDouble(),
          variant: properties['variant'] == 'circular'
              ? ProgressVariant.circular
              : ProgressVariant.linear,
          color: t.primary,
          backgroundColor: t.muted,
        );

      case 'skeleton':
        return CustomSkeleton(
          width: properties['width']?.toDouble() ?? 200,
          height: properties['height']?.toDouble() ?? 20,
        );

      case 'textarea':
        return wrapWithEffects(
          CustomTextarea(
            label: properties['label'] ?? 'Description',
            placeholder: properties['placeholder'] ?? 'Enter text...',
            maxLines: properties['maxLines'] ?? 4,
            backgroundColor: t.background,
            borderColor: t.input,
            focusedBorderColor: t.ring,
            textColor: t.foreground,
            labelColor: t.mutedForeground,
            borderRadius: 8.0 * t.radiusScale,
            fontSize: 14.0 * t.fontSizeScale,
          ),
          borderRadius: 8.0,
        );

      case 'formfield':
        return CustomFormField(
          label: properties['label'] ?? 'Field Label',
          required: properties['required'] ?? false,
          labelColor: t.foreground,
          errorColor: t.destructive,
          fontSize: 14.0 * t.fontSizeScale,
          child: CustomTextField(
            placeholder: 'Example input',
            backgroundColor: t.background,
            borderColor: t.input,
            focusedBorderColor: t.ring,
            borderRadius: 8.0 * t.radiusScale,
          ),
        );

      case 'togglegroup':
        return CustomToggleGroup(
          items: const ['Left', 'Center', 'Right'],
          selectedColor: t.primary,
          selectedTextColor: t.primaryForeground,
          unselectedTextColor: t.foreground,
          borderColor: t.border,
          borderRadius: 8.0 * t.radiusScale,
          fontSize: 14.0 * t.fontSizeScale,
        );

      case 'breadcrumb':
        return CustomBreadcrumb(
          items: const [
            BreadcrumbItem(label: 'Home', icon: Icons.home),
            BreadcrumbItem(label: 'Products'),
            BreadcrumbItem(label: 'Details'),
          ],
          textColor: t.mutedForeground,
          activeTextColor: t.foreground,
          fontSize: 14.0 * t.fontSizeScale,
        );

      case 'pagination':
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: CustomPagination(
            currentPage: properties['currentPage'] ?? 1,
            totalPages: properties['totalPages'] ?? 10,
            activeColor: t.primary,
            activeTextColor: t.primaryForeground,
            textColor: t.foreground,
            fontSize: 14.0 * t.fontSizeScale,
            CustomButtonVariant: 32.0,
            showFirstLast: false,
          ),
        );

      case 'empty':
        return CustomEmpty(
          icon: Icons.inbox,
          title: properties['title'] ?? 'No items',
          description:
              properties['description'] ?? 'Try adjusting your filters',
          iconColor: t.muted,
          titleColor: t.foreground,
          descriptionColor: t.mutedForeground,
          titleFontSize: 18.0 * t.fontSizeScale,
        );

      case 'spinner':
        return CustomSpinner(
          type: properties['type'] == 'dots'
              ? SpinnerType.dots
              : SpinnerType.circular,
          size: 40.0 * t.spacingScale,
          color: t.primary,
        );

      case 'dropdown':
        return SizedBox(
          width: 150,
          child: CustomDropdown(
            trigger: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12 * t.spacingScale,
                vertical: 8 * t.spacingScale,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: t.border),
                borderRadius: BorderRadius.circular(8 * t.radiusScale),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      'Menu',
                      style: TextStyle(color: t.foreground),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.arrow_drop_down, color: t.foreground, size: 20),
                ],
              ),
            ),
            items: [
              DropdownItem(label: 'Item 1', icon: Icons.person),
              DropdownItem(label: 'Item 2', icon: Icons.settings),
            ],
            backgroundColor: t.popover,
            textColor: t.popoverForeground,
            borderRadius: 8 * t.radiusScale,
          ),
        );

      case 'popover':
        return CustomPopover(
          child: Container(
            padding: EdgeInsets.all(12 * t.spacingScale),
            decoration: BoxDecoration(
              color: t.primary,
              borderRadius: BorderRadius.circular(8 * t.radiusScale),
            ),
            child: Text(
              'Hover',
              style: TextStyle(color: t.primaryForeground, fontSize: 14),
            ),
          ),
          content: Text(
            'Popover content',
            style: TextStyle(color: t.popoverForeground),
          ),
          backgroundColor: t.popover,
          borderColor: t.border,
          borderRadius: 8 * t.radiusScale,
        );

      case 'table':
        return CustomTable(
          columns: const [
            TableColumn(header: 'Name'),
            TableColumn(header: 'Status'),
          ],
          rows: const [
            ['Alice', 'Active'],
            ['Bob', 'Inactive'],
          ],
          headerBackgroundColor: t.muted,
          headerTextColor: t.mutedForeground,
          rowBackgroundColor: t.background,
          borderColor: t.border,
          fontSize: 13.0 * t.fontSizeScale,
        );

      default:
        return const SizedBox();
    }
  }

  // Helper methods for enum conversions
  CustomButtonVariant _getButtonVariant(String? variant) {
    switch (variant) {
      case 'outlined':
        return CustomButtonVariant.outlined;
      case 'text':
        return CustomButtonVariant.text;
      case 'icon':
        return CustomButtonVariant.icon;
      default:
        return CustomButtonVariant.filled;
    }
  }

  CustomButtonSize _getButtonSize(String? size) {
    switch (size) {
      case 'small':
        return CustomButtonSize.small;
      case 'large':
        return CustomButtonSize.large;
      default:
        return CustomButtonSize.medium;
    }
  }

  CustomCardVariant _getCardVariant(String? variant) {
    switch (variant) {
      case 'outlined':
        return CustomCardVariant.outlined;
      case 'filled':
        return CustomCardVariant.filled;
      default:
        return CustomCardVariant.elevated;
    }
  }

  CustomTextFieldSize _getTextFieldSize(String? size) {
    switch (size) {
      case 'small':
        return CustomTextFieldSize.small;
      case 'large':
        return CustomTextFieldSize.large;
      default:
        return CustomTextFieldSize.medium;
    }
  }

  CustomAppBarSize _getAppBarSize(String? size) {
    switch (size) {
      case 'small':
        return CustomAppBarSize.small;
      case 'large':
        return CustomAppBarSize.large;
      default:
        return CustomAppBarSize.medium;
    }
  }

  CustomBottomNavBarSize _getBottomNavSize(String? size) {
    switch (size) {
      case 'small':
        return CustomBottomNavBarSize.small;
      case 'large':
        return CustomBottomNavBarSize.large;
      default:
        return CustomBottomNavBarSize.medium;
    }
  }

  IconData _getIcon(String? iconName) {
    switch (iconName) {
      case 'home':
        return Icons.home;
      case 'search':
        return Icons.search;
      case 'person':
        return Icons.person;
      case 'settings':
        return Icons.settings;
      case 'favorite':
        return Icons.favorite;
      case 'email':
        return Icons.email;
      case 'lock':
        return Icons.lock;
      case 'phone':
        return Icons.phone;
      default:
        return Icons.circle;
    }
  }

  CustomBadgeVariant _getBadgeVariant(String? variant) {
    switch (variant) {
      case 'secondary':
        return CustomBadgeVariant.secondary;
      case 'destructive':
        return CustomBadgeVariant.destructive;
      case 'outline':
        return CustomBadgeVariant.outline;
      case 'success':
        return CustomBadgeVariant.success;
      default:
        return CustomBadgeVariant.default_;
    }
  }

  CustomAvatarSize _getAvatarSize(String? size) {
    switch (size) {
      case 'sm':
        return CustomAvatarSize.sm;
      case 'lg':
        return CustomAvatarSize.lg;
      case 'xl':
        return CustomAvatarSize.xl;
      default:
        return CustomAvatarSize.md;
    }
  }

  CustomAlertVariant _getAlertVariant(String? variant) {
    switch (variant) {
      case 'destructive':
        return CustomAlertVariant.destructive;
      case 'success':
        return CustomAlertVariant.success;
      case 'warning':
        return CustomAlertVariant.warning;
      case 'info':
        return CustomAlertVariant.info;
      default:
        return CustomAlertVariant.default_;
    }
  }

  /// Generate Dart code for this component
  String generateCode() {
    // This will be implemented in code_generator.dart
    return '';
  }
}

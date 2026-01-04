import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';

class CustomBottomNavItem {
  final IconData icon;
  final String label;
  final IconData? activeIcon;

  const CustomBottomNavItem({
    required this.icon,
    required this.label,
    this.activeIcon,
  });
}

enum CustomBottomNavBarSize { small, medium, large }

/// A customizable bottom navigation bar component
class CustomBottomNavBar extends StatelessWidget {
  final List<CustomBottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final CustomBottomNavBarSize size;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? elevation;
  final double? iconSize;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool showLabels;
  final double? height;

  const CustomBottomNavBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.size = CustomBottomNavBarSize.medium,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.elevation,
    this.iconSize,
    this.fontSize,
    this.fontWeight,
    this.showLabels = true,
    this.height,
  }) : super(key: key);

  double _getDefaultIconSize() {
    switch (size) {
      case CustomBottomNavBarSize.small:
        return 20.0;
      case CustomBottomNavBarSize.medium:
        return 24.0;
      case CustomBottomNavBarSize.large:
        return 28.0;
    }
  }

  double _getDefaultFontSize() {
    switch (size) {
      case CustomBottomNavBarSize.small:
        return UITypography.fontSizeXS;
      case CustomBottomNavBarSize.medium:
        return UITypography.fontSizeSM;
      case CustomBottomNavBarSize.large:
        return UITypography.fontSizeBase;
    }
  }

  double _getDefaultHeight() {
    switch (size) {
      case CustomBottomNavBarSize.small:
        return 56.0;
      case CustomBottomNavBarSize.medium:
        return 64.0;
      case CustomBottomNavBarSize.large:
        return 72.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultBgColor = backgroundColor ?? UIColors.white;
    final defaultSelectedColor = selectedItemColor ?? UIColors.primary;
    final defaultUnselectedColor = unselectedItemColor ?? UIColors.gray500;
    final defaultElevation = elevation ?? 8.0;
    final defaultIconSize = iconSize ?? _getDefaultIconSize();
    final defaultFontSize = fontSize ?? _getDefaultFontSize();
    final defaultFontWeight = fontWeight ?? UITypography.fontWeightMedium;
    final defaultHeight = height ?? _getDefaultHeight();

    return Container(
      height: defaultHeight,
      decoration: BoxDecoration(
        color: defaultBgColor,
        boxShadow: defaultElevation > 0
            ? [
                BoxShadow(
                  color: UIColors.gray900.withOpacity(0.1),
                  blurRadius: defaultElevation * 2,
                  offset: Offset(0, -defaultElevation / 2),
                ),
              ]
            : null,
      ),
      child: BottomNavigationBar(
        items: items.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item.icon),
            activeIcon: item.activeIcon != null
                ? Icon(item.activeIcon)
                : Icon(item.icon),
            label: showLabels ? item.label : '',
          );
        }).toList(),
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: defaultBgColor,
        selectedItemColor: defaultSelectedColor,
        unselectedItemColor: defaultUnselectedColor,
        iconSize: defaultIconSize,
        selectedFontSize: showLabels ? defaultFontSize : 0,
        unselectedFontSize: showLabels ? defaultFontSize : 0,
        selectedLabelStyle: TextStyle(fontWeight: defaultFontWeight),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}

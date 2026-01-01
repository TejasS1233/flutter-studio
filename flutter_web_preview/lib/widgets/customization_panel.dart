import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../widgets/theme_customizer.dart';

class CustomizationPanel extends StatelessWidget {
  const CustomizationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        if (appState.selectedComponents.isEmpty) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.tune, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Global theme controls on left',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        }

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: const TabBar(
                    indicatorColor: Color(0xFF667eea),
                    labelColor: Color(0xFF667eea),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.palette, size: 20), text: 'Theme'),
                      Tab(icon: Icon(Icons.tune, size: 20), text: 'Props'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      const ThemeCustomizer(),
                      _buildPropertiesTab(context, appState),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPropertiesTab(BuildContext context, AppState appState) {
    if (appState.selectedComponents.length != 1) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            appState.selectedComponents.isEmpty
                ? 'No components selected'
                : 'Select a single component to edit properties',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final component = appState.selectedComponents.first;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Icon(component.icon, color: const Color(0xFF0460c6), size: 20),
            const SizedBox(width: 8),
            Text(
              component.displayName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 8),
        ...component.properties.entries.map((entry) {
          return _buildPropertyControl(
            context,
            appState,
            component,
            entry.key,
            entry.value,
          );
        }).toList(),
      ],
    );
  }

  Widget _buildPropertyControl(
    BuildContext context,
    AppState appState,
    component,
    String key,
    dynamic value,
  ) {
    if (value is bool) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _formatPropertyName(key),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Switch(
              value: value,
              onChanged: (newValue) {
                appState.updateProperty(component.id, key, newValue);
              },
              activeColor: const Color(0xFF0460c6),
            ),
          ],
        ),
      );
    } else if (value is num) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatPropertyName(key),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Slider(
              value: value.toDouble(),
              min: 0,
              max: _getMaxValue(key),
              divisions: 100,
              activeColor: const Color(0xFF0460c6),
              onChanged: (newValue) {
                appState.updateProperty(component.id, key, newValue);
              },
            ),
          ],
        ),
      );
    } else if (value is String) {
      // Check if it's a variant/size/enum property
      if (key.contains('variant') || key.contains('size') || key == 'type') {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _formatPropertyName(key),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _getOptionsForProperty(key).map((option) {
                  final isSelected = value == option;
                  return ChoiceChip(
                    label: Text(option),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        appState.updateProperty(component.id, key, option);
                      }
                    },
                    selectedColor: const Color(0xFF0460c6).withOpacity(0.2),
                    labelStyle: TextStyle(
                      color: isSelected ? const Color(0xFF0460c6) : Colors.grey,
                      fontSize: 12,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      } else {
        // Text input
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _formatPropertyName(key),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: TextEditingController(text: value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  isDense: true,
                ),
                onChanged: (newValue) {
                  appState.updateProperty(component.id, key, newValue);
                },
              ),
            ],
          ),
        );
      }
    } else if (value is Color) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _formatPropertyName(key),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              onTap: () =>
                  _showColorPicker(context, appState, component, key, value),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: value,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  String _formatPropertyName(String key) {
    // Convert camelCase to Title Case
    return key
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(1)}')
        .replaceFirst(key[0], key[0].toUpperCase())
        .trim();
  }

  double _getMaxValue(String key) {
    if (key.contains('radius') || key.contains('padding')) {
      return 50;
    } else if (key.contains('elevation')) {
      return 20;
    } else if (key.contains('fontSize')) {
      return 40;
    } else if (key.contains('width') || key.contains('height')) {
      return 500;
    } else if (key.contains('borderWidth')) {
      return 10;
    }
    return 100;
  }

  List<String> _getOptionsForProperty(String key) {
    if (key == 'variant') {
      return ['filled', 'outlined', 'text', 'elevated', 'ghost'];
    } else if (key == 'size') {
      return ['small', 'medium', 'large'];
    } else if (key == 'type') {
      return ['default', 'info', 'success', 'warning', 'error'];
    }
    return [];
  }

  void _showColorPicker(
    BuildContext context,
    AppState appState,
    component,
    String key,
    Color currentColor,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Pick ${_formatPropertyName(key)}'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: currentColor,
            onColorChanged: (color) {
              appState.updateProperty(component.id, key, color);
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}

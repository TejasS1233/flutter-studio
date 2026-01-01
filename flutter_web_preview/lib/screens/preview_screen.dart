import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;
import '../models/app_state.dart';
import '../widgets/component_selector.dart';
import '../widgets/mobile_phone_frame.dart';
import '../widgets/customization_panel.dart';
import '../services/zip_builder.dart';
import '../services/download_helper.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  Future<void> _handleDownload(BuildContext context, AppState appState) async {
    if (appState.selectedComponents.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select components to export')),
      );
      return;
    }

    try {
      final zipData = await ZipBuilder.buildThemeZip(
        appState.selectedComponents,
        appState.globalTheme,
      );

      DownloadHelper.downloadZip(zipData, 'flutter_ui_theme.zip');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Theme exported successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Export failed: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  // Logo/Branding
                  Image.asset(
                    'assets/logo-32x32.png',
                    width: 32,
                    height: 32,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0460c6), Color(0xFF0573e6)],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.widgets_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Flutter Studio',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1a1a1a),
                      letterSpacing: -0.3,
                    ),
                  ),
                  const Spacer(),
                  // Preset Selector
                  Consumer<AppState>(
                    builder: (context, appState, _) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0460c6).withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xFF0460c6).withOpacity(0.2),
                          ),
                        ),
                        child: DropdownButton<PresetType>(
                          value: appState.currentPreset,
                          underline: const SizedBox(),
                          icon: const Icon(Icons.arrow_drop_down, size: 20),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF0460c6),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: PresetType.dashboard,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.dashboard,
                                    size: 16,
                                    color: Color(0xFF0460c6),
                                  ),
                                  SizedBox(width: 8),
                                  Text('Dashboard'),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: PresetType.profile,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 16,
                                    color: Color(0xFF0460c6),
                                  ),
                                  SizedBox(width: 8),
                                  Text('Profile'),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: PresetType.feed,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.view_list,
                                    size: 16,
                                    color: Color(0xFF0460c6),
                                  ),
                                  SizedBox(width: 8),
                                  Text('Feed'),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: PresetType.form,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.article,
                                    size: 16,
                                    color: Color(0xFF0460c6),
                                  ),
                                  SizedBox(width: 8),
                                  Text('Form'),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: PresetType.settings,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    size: 16,
                                    color: Color(0xFF0460c6),
                                  ),
                                  SizedBox(width: 8),
                                  Text('Settings'),
                                ],
                              ),
                            ),
                          ],
                          onChanged: (PresetType? value) {
                            if (value != null) {
                              appState.loadPreset(value);
                            }
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  // GitHub link
                  IconButton(
                    onPressed: () {
                      html.window.open(
                        'https://github.com/TejasS1233/flutter-studio',
                        '_blank',
                      );
                    },
                    icon: const Icon(Icons.code),
                    tooltip: 'GitHub',
                    iconSize: 20,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(width: 8),
                  // Clear button
                  Consumer<AppState>(
                    builder: (context, appState, _) {
                      if (appState.selectedComponents.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return TextButton.icon(
                        onPressed: () => appState.deselectAll(),
                        icon: const Icon(Icons.clear, size: 16),
                        label: const Text('Clear'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  // Component count
                  Consumer<AppState>(
                    builder: (context, appState, _) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: appState.selectedComponents.isNotEmpty
                              ? const Color(0xFF0460c6).withOpacity(0.1)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: appState.selectedComponents.isNotEmpty
                                ? const Color(0xFF0460c6).withOpacity(0.2)
                                : Colors.grey.shade200,
                          ),
                        ),
                        child: Text(
                          '${appState.selectedComponents.length} selected',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: appState.selectedComponents.isNotEmpty
                                ? const Color(0xFF0460c6)
                                : Colors.grey.shade600,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  // Download button
                  Consumer<AppState>(
                    builder: (context, appState, _) {
                      return ElevatedButton.icon(
                        onPressed: () => _handleDownload(context, appState),
                        icon: const Icon(Icons.download_rounded, size: 18),
                        label: const Text('Download ZIP'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1a1a1a),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Consumer<AppState>(
        builder: (context, appState, _) {
          return Row(
            children: [
              SizedBox(
                width: 280,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: const ComponentSelector(),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // Device Frame Selector
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.phone_android,
                            size: 18,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Device:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 12),
                          DropdownButton<DeviceFrame>(
                            value: appState.selectedFrame,
                            underline: const SizedBox(),
                            items: const [
                              DropdownMenuItem(
                                value: DeviceFrame.iphone14,
                                child: Text(
                                  'iPhone 14',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              DropdownMenuItem(
                                value: DeviceFrame.pixel7,
                                child: Text(
                                  'Pixel 7',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              DropdownMenuItem(
                                value: DeviceFrame.ipad,
                                child: Text(
                                  'iPad',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              DropdownMenuItem(
                                value: DeviceFrame.tablet,
                                child: Text(
                                  'Tablet',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                            onChanged: (frame) {
                              if (frame != null) appState.setDeviceFrame(frame);
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Consumer<AppState>(
                        builder: (context, state, _) {
                          // Rebuild when theme or components change
                          return Center(
                            child: MobilePhoneFrame(
                              deviceFrame: state.selectedFrame,
                              components: state.selectedComponents
                                  .map(
                                    (c) =>
                                        c.buildWidget(theme: state.globalTheme),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: const CustomizationPanel(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

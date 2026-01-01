import 'package:flutter/material.dart';
import '../models/component_config.dart';
import '../models/global_theme.dart';

enum DeviceFrame { iphone14, pixel7, ipad, tablet }

enum PresetType { dashboard, profile, feed, form, settings }

class AppState extends ChangeNotifier {
  List<ComponentConfig> _components = [];
  String? _selectedComponentId;
  DeviceFrame _selectedFrame = DeviceFrame.iphone14;
  GlobalTheme _globalTheme = GlobalTheme();
  bool _showPreset = true;
  PresetType? _currentPreset = PresetType.dashboard;

  AppState(this._components);

  List<ComponentConfig> get components => _components;

  List<ComponentConfig> get selectedComponents =>
      _components.where((c) => c.isSelected).toList();

  String? get selectedComponentId => _selectedComponentId;

  ComponentConfig? get selectedComponent => _selectedComponentId != null
      ? _components.firstWhere((c) => c.id == _selectedComponentId!)
      : null;

  DeviceFrame get selectedFrame => _selectedFrame;
  GlobalTheme get globalTheme => _globalTheme;
  bool get showPreset => _showPreset;
  PresetType? get currentPreset => _currentPreset;

  void setDeviceFrame(DeviceFrame frame) {
    _selectedFrame = frame;
    notifyListeners();
  }

  void updateGlobalTheme(GlobalTheme theme) {
    _globalTheme = theme;
    notifyListeners();
  }

  void toggleComponent(String id) {
    final component = _components.firstWhere((c) => c.id == id);
    component.isSelected = !component.isSelected;
    _showPreset = selectedComponents.isEmpty;
    notifyListeners();
  }

  void selectComponentForCustomization(String id) {
    _selectedComponentId = id;
    notifyListeners();
  }

  void updateProperty(String componentId, String key, dynamic value) {
    final component = _components.firstWhere((c) => c.id == componentId);
    component.properties[key] = value;
    notifyListeners();
  }

  void selectAll() {
    for (var component in _components) {
      component.isSelected = true;
    }
    _showPreset = false;
    notifyListeners();
  }

  void deselectAll() {
    for (var component in _components) {
      component.isSelected = false;
    }
    _showPreset = true;
    notifyListeners();
  }

  void loadPreset(PresetType type) {
    _currentPreset = type;
    deselectAll();

    switch (type) {
      case PresetType.dashboard:
        _loadDashboardPreset();
        break;
      case PresetType.profile:
        _loadProfilePreset();
        break;
      case PresetType.feed:
        _loadFeedPreset();
        break;
      case PresetType.form:
        _loadFormPreset();
        break;
      case PresetType.settings:
        _loadSettingsPreset();
        break;
    }

    _showPreset = false;
    notifyListeners();
  }

  void _loadDashboardPreset() {
    final presetConfig = <String, Map<String, dynamic>>{
      'appbar': {'title': 'Dashboard'},
      'card': {'variant': 'elevated'},
      'badge': {'text': 'Pro'},
      'avatar': {'initials': 'TS'},
      'button': {'text': 'View Details', 'variant': 'filled'},
      'progress': {},
      'alert': {
        'title': 'Welcome Back!',
        'description': 'You have 3 new notifications',
      },
      'textfield': {'label': 'Search', 'placeholder': 'Search components...'},
      'chip': {'text': 'Featured'},
      'switch': {},
      'bottomnav': {},
    };
    _applyPresetConfig(presetConfig);
  }

  void _loadProfilePreset() {
    final presetConfig = <String, Map<String, dynamic>>{
      'appbar': {'title': 'Profile'},
      'avatar': {'initials': 'TS', 'size': 'large'},
      'badge': {'text': 'Verified'},
      'card': {'variant': 'outlined'},
      'button': {'text': 'Edit Profile', 'variant': 'outlined'},
      'divider': {},
      'textfield': {'label': 'Bio', 'placeholder': 'Tell us about yourself'},
      'chip': {'text': 'Developer'},
      'switch': {},
      'bottomnav': {},
    };
    _applyPresetConfig(presetConfig);
  }

  void _loadFeedPreset() {
    final presetConfig = <String, Map<String, dynamic>>{
      'appbar': {'title': 'Feed'},
      'textfield': {'label': '', 'placeholder': 'Search posts...'},
      'chip': {'text': 'All'},
      'card': {'variant': 'elevated'},
      'avatar': {'initials': 'JD'},
      'badge': {'text': 'New'},
      'button': {'text': 'Like', 'variant': 'text'},
      'divider': {},
      'bottomnav': {},
    };
    _applyPresetConfig(presetConfig);
  }

  void _loadFormPreset() {
    final presetConfig = <String, Map<String, dynamic>>{
      'appbar': {'title': 'Contact Us'},
      'textfield': {'label': 'Name', 'placeholder': 'Enter your name'},
      'dropdown': {'label': 'Category'},
      'checkbox': {'label': 'Subscribe to newsletter'},
      'radio': {'label': 'Preferred contact method'},
      'slider': {},
      'switch': {},
      'button': {'text': 'Submit', 'variant': 'filled'},
      'alert': {'title': 'Info', 'description': 'All fields are required'},
    };
    _applyPresetConfig(presetConfig);
  }

  void _loadSettingsPreset() {
    final presetConfig = <String, Map<String, dynamic>>{
      'appbar': {'title': 'Settings'},
      'avatar': {'initials': 'TS'},
      'card': {'variant': 'outlined'},
      'switch': {},
      'slider': {},
      'radio': {'label': 'Theme preference'},
      'checkbox': {'label': 'Enable notifications'},
      'divider': {},
      'button': {'text': 'Save Changes', 'variant': 'filled'},
      'alert': {
        'title': 'Tip',
        'description': 'Changes are saved automatically',
      },
      'bottomnav': {},
    };
    _applyPresetConfig(presetConfig);
  }

  void _applyPresetConfig(Map<String, Map<String, dynamic>> config) {
    for (var entry in config.entries) {
      try {
        final component = _components.firstWhere((c) => c.id == entry.key);
        component.isSelected = true;

        // Apply custom properties
        for (var prop in entry.value.entries) {
          component.properties[prop.key] = prop.value;
        }
      } catch (e) {
        // Component not found, skip
      }
    }
  }

  void reorderComponents(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final selected = selectedComponents;
    final item = selected.removeAt(oldIndex);
    selected.insert(newIndex, item);
    notifyListeners();
  }
}

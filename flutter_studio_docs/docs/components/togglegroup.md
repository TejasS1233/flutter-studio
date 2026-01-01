# Toggle Group

Multiple toggle buttons in a group.

## Installation

::: code-group

```bash [CLI]
flutter_studio add togglegroup
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomToggleGroup(
  options: ['Left', 'Center', 'Right'],
  selectedIndex: selectedAlignment,
  onChanged: (index) {
    setState(() {
      selectedAlignment = index;
    });
  },
)
```

### Multiple Selection

```dart
CustomToggleGroup(
  options: ['Bold', 'Italic', 'Underline'],
  multiSelect: true,
  selectedIndices: [0, 2], // Bold and Underline selected
  onMultiChanged: (indices) {
    setState(() {
      selectedIndices = indices;
    });
  },
)
```

## API Reference

### Properties

<table class="props-table">
  <thead>
    <tr>
      <th>Property</th>
      <th>Type</th>
      <th>Default</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>options</code></td>
      <td><code>List&lt;String&gt;</code></td>
      <td>required</td>
      <td>Toggle options</td>
    </tr>
    <tr>
      <td><code>selectedIndex</code></td>
      <td><code>int?</code></td>
      <td><code>null</code></td>
      <td>Selected option index</td>
    </tr>
    <tr>
      <td><code>multiSelect</code></td>
      <td><code>bool</code></td>
      <td><code>false</code></td>
      <td>Allow multiple selections</td>
    </tr>
  </tbody>
</table>

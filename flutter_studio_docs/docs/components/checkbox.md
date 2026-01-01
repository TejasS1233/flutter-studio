# Checkbox

Toggle selection with label support.

## Installation

::: code-group

```bash [CLI]
flutter_studio add checkbox
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomCheckbox(
  label: 'Accept terms and conditions',
  value: isAccepted,
  onChanged: (value) {
    setState(() {
      isAccepted = value ?? false;
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
      <td><code>value</code></td>
      <td><code>bool</code></td>
      <td>required</td>
      <td>Current checked state</td>
    </tr>
    <tr>
      <td><code>onChanged</code></td>
      <td><code>ValueChanged?</code></td>
      <td><code>null</code></td>
      <td>Callback when state changes</td>
    </tr>
  </tbody>
</table>

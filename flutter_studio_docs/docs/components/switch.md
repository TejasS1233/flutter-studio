# Switch

Toggle boolean state with smooth animation.

## Installation

::: code-group

```bash [CLI]
flutter_studio add switch
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomSwitch(
  value: isEnabled,
  onChanged: (value) {
    setState(() {
      isEnabled = value;
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
      <td>Current switch state</td>
    </tr>
    <tr>
      <td><code>onChanged</code></td>
      <td><code>ValueChanged?</code></td>
      <td><code>null</code></td>
      <td>Callback when state changes</td>
    </tr>
  </tbody>
</table>

# Tooltip

Contextual help text on hover.

## Installation

::: code-group

```bash [CLI]
flutter_studio add tooltip
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomTooltip(
  message: 'Click to edit',
  child: IconButton(
    icon: Icon(Icons.edit),
    onPressed: () {},
  ),
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
      <td><code>message</code></td>
      <td><code>String</code></td>
      <td>required</td>
      <td>Tooltip text</td>
    </tr>
    <tr>
      <td><code>child</code></td>
      <td><code>Widget</code></td>
      <td>required</td>
      <td>Widget to show tooltip for</td>
    </tr>
  </tbody>
</table>

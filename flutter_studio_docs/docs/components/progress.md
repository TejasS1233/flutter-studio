# Progress

Progress bars and indicators for tracking operations.

## Installation

::: code-group

```bash [CLI]
flutter_studio add progress
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomProgress(
  value: 0.65, // 65%
)

// With label
CustomProgress(
  value: 0.75,
  showLabel: true,
)

// Indeterminate
CustomProgress(
  indeterminate: true,
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
      <td><code>double?</code></td>
      <td><code>null</code></td>
      <td>Progress value (0.0 - 1.0)</td>
    </tr>
    <tr>
      <td><code>showLabel</code></td>
      <td><code>bool</code></td>
      <td><code>false</code></td>
      <td>Show percentage label</td>
    </tr>
  </tbody>
</table>

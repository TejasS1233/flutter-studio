# Badge

Status indicators and notification counts.

## Installation

::: code-group

```bash [CLI]
flutter_studio add badge
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
// Simple badge
CustomBadge(
  label: 'New',
)

// With count
CustomBadge(
  count: 5,
)

// Different variants
CustomBadge(
  label: 'Success',
  variant: BadgeVariant.success,
)

CustomBadge(
  label: 'Error',
  variant: BadgeVariant.error,
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
      <td><code>label</code></td>
      <td><code>String?</code></td>
      <td><code>null</code></td>
      <td>Badge text</td>
    </tr>
    <tr>
      <td><code>count</code></td>
      <td><code>int?</code></td>
      <td><code>null</code></td>
      <td>Notification count</td>
    </tr>
    <tr>
      <td><code>variant</code></td>
      <td><code>BadgeVariant</code></td>
      <td><code>default</code></td>
      <td>Badge style variant</td>
    </tr>
  </tbody>
</table>

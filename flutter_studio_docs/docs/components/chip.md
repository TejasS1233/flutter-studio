# Chip

Compact labeled elements for tags and filters.

## Installation

::: code-group

```bash [CLI]
flutter_studio add chip
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
// Simple chip
CustomChip(
  label: 'Flutter',
)

// With icon
CustomChip(
  label: 'Verified',
  icon: Icons.check,
)

// Removable chip
CustomChip(
  label: 'Tag',
  onRemove: () {
    // Handle removal
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
      <td><code>label</code></td>
      <td><code>String</code></td>
      <td>required</td>
      <td>Chip label</td>
    </tr>
    <tr>
      <td><code>icon</code></td>
      <td><code>IconData?</code></td>
      <td><code>null</code></td>
      <td>Leading icon</td>
    </tr>
    <tr>
      <td><code>onRemove</code></td>
      <td><code>VoidCallback?</code></td>
      <td><code>null</code></td>
      <td>Remove callback</td>
    </tr>
  </tbody>
</table>

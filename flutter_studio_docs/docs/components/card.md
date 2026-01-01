# Card

Container component with elevation, borders, and flexible content layout.

## Installation

::: code-group

```bash [CLI]
flutter_studio add card
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomCard(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Card content'),
  ),
)
```

### With Header

```dart
CustomCard(
  title: 'Card Title',
  subtitle: 'Optional subtitle',
  child: Text('Content'),
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
      <td><code>child</code></td>
      <td><code>Widget</code></td>
      <td>required</td>
      <td>Main content</td>
    </tr>
    <tr>
      <td><code>title</code></td>
      <td><code>String?</code></td>
      <td><code>null</code></td>
      <td>Card header title</td>
    </tr>
  </tbody>
</table>

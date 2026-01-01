# Alert

Inline notification messages with different severity levels.

## Installation

::: code-group

```bash [CLI]
flutter_studio add alert
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomAlert(
  type: AlertType.success,
  title: 'Success',
  message: 'Your changes have been saved.',
)
```

### Alert Types

```dart
// Success
CustomAlert(
  type: AlertType.success,
  message: 'Operation completed successfully',
)

// Error
CustomAlert(
  type: AlertType.error,
  message: 'Something went wrong',
)

// Warning
CustomAlert(
  type: AlertType.warning,
  message: 'Please review your input',
)

// Info
CustomAlert(
  type: AlertType.info,
  message: 'New features available',
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
      <td><code>type</code></td>
      <td><code>AlertType</code></td>
      <td>required</td>
      <td>Alert severity type</td>
    </tr>
    <tr>
      <td><code>message</code></td>
      <td><code>String</code></td>
      <td>required</td>
      <td>Alert message</td>
    </tr>
  </tbody>
</table>

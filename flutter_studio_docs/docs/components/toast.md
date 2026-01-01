# Toast

Temporary notification popups that appear and disappear automatically.

## Installation

::: code-group

```bash [CLI]
flutter_studio add toast
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomToast.show(
  context,
  message: 'File saved successfully',
  type: ToastType.success,
)
```

### Toast Types

```dart
// Success toast
CustomToast.show(
  context,
  message: 'Success!',
  type: ToastType.success,
)

// Error toast
CustomToast.show(
  context,
  message: 'Error occurred',
  type: ToastType.error,
)

// Info toast
CustomToast.show(
  context,
  message: 'Did you know?',
  type: ToastType.info,
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
      <td>Toast message</td>
    </tr>
    <tr>
      <td><code>type</code></td>
      <td><code>ToastType</code></td>
      <td><code>info</code></td>
      <td>Toast type</td>
    </tr>
    <tr>
      <td><code>duration</code></td>
      <td><code>Duration</code></td>
      <td><code>3s</code></td>
      <td>Display duration</td>
    </tr>
  </tbody>
</table>

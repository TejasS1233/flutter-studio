# Text Field

Single-line text input with validation support.

## Installation

::: code-group

```bash [CLI]
flutter_studio add textfield
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

### Basic Text Field

```dart
CustomTextField(
  label: 'Email',
  placeholder: 'Enter your email',
  onChanged: (value) {
    print(value);
  },
)
```

### With Validation

```dart
CustomTextField(
  label: 'Email',
  validator: (value) {
    if (value?.isEmpty ?? true) {
      return 'Email is required';
    }
    return null;
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
      <td><code>String?</code></td>
      <td><code>null</code></td>
      <td>Field label</td>
    </tr>
    <tr>
      <td><code>placeholder</code></td>
      <td><code>String?</code></td>
      <td><code>null</code></td>
      <td>Placeholder text</td>
    </tr>
    <tr>
      <td><code>onChanged</code></td>
      <td><code>ValueChanged?</code></td>
      <td><code>null</code></td>
      <td>Callback when value changes</td>
    </tr>
  </tbody>
</table>

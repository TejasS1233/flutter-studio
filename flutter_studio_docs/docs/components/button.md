# Button

A versatile button component with multiple variants, sizes, and states.

## Installation

::: code-group

```bash [CLI]
flutter_studio add button
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

### Basic Button

```dart
import 'package:your_app/components/custom_button.dart';

CustomButton(
  text: 'Click Me',
  onPressed: () {
    print('Button pressed!');
  },
)
```

### Button Variants

```dart
// Primary button (default)
CustomButton(
  text: 'Primary',
  variant: ButtonVariant.primary,
  onPressed: () {},
)

// Secondary button
CustomButton(
  text: 'Secondary',
  variant: ButtonVariant.secondary,
  onPressed: () {},
)

// Outlined button
CustomButton(
  text: 'Outlined',
  variant: ButtonVariant.outlined,
  onPressed: () {},
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
      <td><code>text</code></td>
      <td><code>String?</code></td>
      <td><code>null</code></td>
      <td>Button text label</td>
    </tr>
    <tr>
      <td><code>onPressed</code></td>
      <td><code>VoidCallback?</code></td>
      <td><code>null</code></td>
      <td>Callback when button is pressed</td>
    </tr>
    <tr>
      <td><code>variant</code></td>
      <td><code>ButtonVariant</code></td>
      <td><code>primary</code></td>
      <td>Visual style variant</td>
    </tr>
  </tbody>
</table>

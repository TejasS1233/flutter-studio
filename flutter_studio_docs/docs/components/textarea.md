# Text Area

Multi-line text input component.

## Installation

::: code-group

```bash [CLI]
flutter_studio add textarea
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomTextArea(
  label: 'Description',
  placeholder: 'Enter description',
  maxLines: 5,
  onChanged: (value) {
    print(value);
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
      <td><code>maxLines</code></td>
      <td><code>int</code></td>
      <td><code>3</code></td>
      <td>Number of visible lines</td>
    </tr>
  </tbody>
</table>

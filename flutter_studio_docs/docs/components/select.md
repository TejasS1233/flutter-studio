# Select

Dropdown selection component.

## Installation

::: code-group

```bash [CLI]
flutter_studio add select
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomSelect<String>(
  value: selectedCountry,
  items: ['USA', 'UK', 'Canada'],
  onChanged: (value) {
    setState(() {
      selectedCountry = value;
    });
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
      <td><code>value</code></td>
      <td><code>T?</code></td>
      <td><code>null</code></td>
      <td>Currently selected value</td>
    </tr>
    <tr>
      <td><code>items</code></td>
      <td><code>List&lt;T&gt;</code></td>
      <td>required</td>
      <td>List of selectable items</td>
    </tr>
  </tbody>
</table>

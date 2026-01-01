# Dropdown

Advanced dropdown menu with search and grouping.

## Installation

::: code-group

```bash [CLI]
flutter_studio add dropdown
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomDropdown(
  items: dropdownItems,
  onSelected: (item) {
    print('Selected: $item');
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
      <td><code>items</code></td>
      <td><code>List</code></td>
      <td>required</td>
      <td>Dropdown items</td>
    </tr>
    <tr>
      <td><code>onSelected</code></td>
      <td><code>Function</code></td>
      <td><code>null</code></td>
      <td>Callback when item is selected</td>
    </tr>
  </tbody>
</table>

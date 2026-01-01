# Breadcrumb

Hierarchical navigation showing current location.

## Installation

::: code-group

```bash [CLI]
flutter_studio add breadcrumb
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomBreadcrumb(
  items: [
    BreadcrumbItem(label: 'Home', onTap: () {}),
    BreadcrumbItem(label: 'Products', onTap: () {}),
    BreadcrumbItem(label: 'Details'),
  ],
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
      <td>Breadcrumb items</td>
    </tr>
  </tbody>
</table>

# Pagination

Page navigation controls for lists and tables.

## Installation

::: code-group

```bash [CLI]
flutter_studio add pagination
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomPagination(
  currentPage: currentPage,
  totalPages: 10,
  onPageChanged: (page) {
    setState(() {
      currentPage = page;
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
      <td><code>currentPage</code></td>
      <td><code>int</code></td>
      <td>required</td>
      <td>Current page number</td>
    </tr>
    <tr>
      <td><code>totalPages</code></td>
      <td><code>int</code></td>
      <td>required</td>
      <td>Total number of pages</td>
    </tr>
  </tbody>
</table>

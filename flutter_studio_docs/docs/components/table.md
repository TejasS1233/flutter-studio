# Table

Data tables with sorting and filtering.

## Installation

::: code-group

```bash [CLI]
flutter_studio add table
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomTable(
  columns: [
    TableColumn(label: 'Name', key: 'name'),
    TableColumn(label: 'Email', key: 'email'),
    TableColumn(label: 'Status', key: 'status'),
  ],
  rows: [
    {'name': 'John Doe', 'email': 'john@example.com', 'status': 'Active'},
    {'name': 'Jane Smith', 'email': 'jane@example.com', 'status': 'Inactive'},
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
      <td><code>columns</code></td>
      <td><code>List</code></td>
      <td>required</td>
      <td>Table columns</td>
    </tr>
    <tr>
      <td><code>rows</code></td>
      <td><code>List</code></td>
      <td>required</td>
      <td>Table data rows</td>
    </tr>
  </tbody>
</table>

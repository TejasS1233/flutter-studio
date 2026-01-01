# Dialog

Modal dialog boxes for user interactions and confirmations.

## Installation

::: code-group

```bash [CLI]
flutter_studio add dialog
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomDialog.show(
  context,
  title: 'Confirm Delete',
  content: 'Are you sure you want to delete this item?',
  actions: [
    DialogAction(
      label: 'Cancel',
      onPressed: () => Navigator.pop(context),
    ),
    DialogAction(
      label: 'Delete',
      isDestructive: true,
      onPressed: () {
        // Handle delete
        Navigator.pop(context);
      },
    ),
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
      <td><code>title</code></td>
      <td><code>String</code></td>
      <td>required</td>
      <td>Dialog title</td>
    </tr>
    <tr>
      <td><code>content</code></td>
      <td><code>String</code></td>
      <td>required</td>
      <td>Dialog content</td>
    </tr>
    <tr>
      <td><code>actions</code></td>
      <td><code>List</code></td>
      <td><code>[]</code></td>
      <td>Action buttons</td>
    </tr>
  </tbody>
</table>

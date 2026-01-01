# App Bar

Top navigation bar with actions and branding.

## Installation

::: code-group

```bash [CLI]
flutter_studio add appbar
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomAppBar(
  title: 'My App',
  actions: [
    IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {},
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
      <td>App bar title</td>
    </tr>
    <tr>
      <td><code>actions</code></td>
      <td><code>List&lt;Widget&gt;?</code></td>
      <td><code>null</code></td>
      <td>Action buttons</td>
    </tr>
  </tbody>
</table>

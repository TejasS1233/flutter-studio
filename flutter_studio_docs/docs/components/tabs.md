# Tabs

Tabbed content navigation component.

## Installation

::: code-group

```bash [CLI]
flutter_studio add tabs
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomTabs(
  tabs: ['Overview', 'Details', 'Reviews'],
  children: [
    OverviewTab(),
    DetailsTab(),
    ReviewsTab(),
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
      <td><code>tabs</code></td>
      <td><code>List&lt;String&gt;</code></td>
      <td>required</td>
      <td>Tab labels</td>
    </tr>
    <tr>
      <td><code>children</code></td>
      <td><code>List&lt;Widget&gt;</code></td>
      <td>required</td>
      <td>Tab content</td>
    </tr>
  </tbody>
</table>

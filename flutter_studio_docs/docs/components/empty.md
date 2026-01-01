# Empty

Empty state placeholders with messaging.

## Installation

::: code-group

```bash [CLI]
flutter_studio add empty
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomEmpty(
  icon: Icons.inbox,
  title: 'No messages',
  description: 'You have no messages at this time',
  action: CustomButton(
    text: 'Compose',
    onPressed: () {},
  ),
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
      <td><code>icon</code></td>
      <td><code>IconData?</code></td>
      <td><code>null</code></td>
      <td>Empty state icon</td>
    </tr>
    <tr>
      <td><code>title</code></td>
      <td><code>String</code></td>
      <td>required</td>
      <td>Empty state title</td>
    </tr>
    <tr>
      <td><code>description</code></td>
      <td><code>String?</code></td>
      <td><code>null</code></td>
      <td>Description text</td>
    </tr>
  </tbody>
</table>

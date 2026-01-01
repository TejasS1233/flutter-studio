# Avatar

User profile images and placeholders.

## Installation

::: code-group

```bash [CLI]
flutter_studio add avatar
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
// Image avatar
CustomAvatar(
  imageUrl: 'https://example.com/avatar.jpg',
  size: 64,
)

// Initials avatar
CustomAvatar(
  initials: 'JD',
  size: 64,
)

// Icon avatar
CustomAvatar(
  icon: Icons.person,
  size: 64,
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
      <td><code>imageUrl</code></td>
      <td><code>String?</code></td>
      <td><code>null</code></td>
      <td>Avatar image URL</td>
    </tr>
    <tr>
      <td><code>initials</code></td>
      <td><code>String?</code></td>
      <td><code>null</code></td>
      <td>User initials</td>
    </tr>
    <tr>
      <td><code>size</code></td>
      <td><code>double</code></td>
      <td><code>40</code></td>
      <td>Avatar size</td>
    </tr>
  </tbody>
</table>

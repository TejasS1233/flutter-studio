# Bottom Nav Bar

Bottom navigation for primary app sections.

## Installation

::: code-group

```bash [CLI]
flutter_studio add bottomnavbar
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomBottomNavBar(
  currentIndex: selectedIndex,
  items: [
    BottomNavItem(icon: Icons.home, label: 'Home'),
    BottomNavItem(icon: Icons.search, label: 'Search'),
    BottomNavItem(icon: Icons.person, label: 'Profile'),
  ],
  onTap: (index) {
    setState(() {
      selectedIndex = index;
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
      <td><code>currentIndex</code></td>
      <td><code>int</code></td>
      <td>required</td>
      <td>Selected tab index</td>
    </tr>
    <tr>
      <td><code>items</code></td>
      <td><code>List</code></td>
      <td>required</td>
      <td>Navigation items</td>
    </tr>
  </tbody>
</table>

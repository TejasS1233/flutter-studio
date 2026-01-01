# Slider

Select a value from a range.

## Installation

::: code-group

```bash [CLI]
flutter_studio add slider
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomSlider(
  value: volume,
  min: 0,
  max: 100,
  onChanged: (value) {
    setState(() {
      volume = value;
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
      <td><code>value</code></td>
      <td><code>double</code></td>
      <td>required</td>
      <td>Current slider value</td>
    </tr>
    <tr>
      <td><code>min</code></td>
      <td><code>double</code></td>
      <td><code>0.0</code></td>
      <td>Minimum value</td>
    </tr>
    <tr>
      <td><code>max</code></td>
      <td><code>double</code></td>
      <td><code>1.0</code></td>
      <td>Maximum value</td>
    </tr>
  </tbody>
</table>

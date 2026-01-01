# Form Field

Complete form input with label, validation, and error handling.

## Installation

::: code-group

```bash [CLI]
flutter_studio add formfield
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomFormField(
  label: 'Email Address',
  placeholder: 'your@email.com',
  helperText: 'We will never share your email',
  validator: (value) {
    if (value?.isEmpty ?? true) {
      return 'Email is required';
    }
    if (!value!.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  },
  onChanged: (value) {
    print(value);
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
      <td><code>label</code></td>
      <td><code>String</code></td>
      <td>required</td>
      <td>Field label</td>
    </tr>
    <tr>
      <td><code>placeholder</code></td>
      <td><code>String?</code></td>
      <td><code>null</code></td>
      <td>Placeholder text</td>
    </tr>
    <tr>
      <td><code>validator</code></td>
      <td><code>Function?</code></td>
      <td><code>null</code></td>
      <td>Validation function</td>
    </tr>
    <tr>
      <td><code>helperText</code></td>
      <td><code>String?</code></td>
      <td><code>null</code></td>
      <td>Helper text below field</td>
    </tr>
  </tbody>
</table>

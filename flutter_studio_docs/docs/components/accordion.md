# Accordion

Collapsible content sections.

## Installation

::: code-group

```bash [CLI]
flutter_studio add accordion
```

```bash [Package]
flutter pub add flutter_studio
```

:::

## Usage

```dart
CustomAccordion(
  items: [
    AccordionItem(
      title: 'Section 1',
      content: Text('Content for section 1'),
    ),
    AccordionItem(
      title: 'Section 2',
      content: Text('Content for section 2'),
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
      <td><code>items</code></td>
      <td><code>List</code></td>
      <td>required</td>
      <td>Accordion items</td>
    </tr>
    <tr>
      <td><code>allowMultiple</code></td>
      <td><code>bool</code></td>
      <td><code>false</code></td>
      <td>Allow multiple open sections</td>
    </tr>
  </tbody>
</table>

# Flutter Studio Documentation

Official documentation website for Flutter Studio component library, built with VitePress.

## Features

- Comprehensive documentation for 40+ Flutter components
- Interactive component playground integration
- Getting started guides and tutorials
- CLI vs Package mode comparison
- Theming and customization documentation
- Fast search functionality
- Responsive design

## Development

### Prerequisites

- Node.js 18+ and npm

### Local Setup

```bash
# Install dependencies
npm install

# Start development server
npm run docs:dev

# Build for production
npm run docs:build

# Preview production build
npm run docs:preview
```

The development server will be available at `http://localhost:5173`

## Project Structure

```
flutter_studio_docs/
├── docs/
│   ├── .vitepress/
│   │   ├── config.mts          # VitePress configuration
│   │   └── theme/
│   │       ├── index.ts        # Theme entry point
│   │       └── custom.css      # Custom styles
│   ├── public/
│   │   ├── logo.png            # Logo and assets
│   │   └── favicon.ico         # Favicon files
│   ├── index.md                # Home page
│   ├── docs/
│   │   ├── introduction.md     # Getting started
│   │   ├── installation.md     # Installation guide
│   │   ├── cli-vs-package.md   # Mode comparison
│   │   └── theming.md          # Theming guide
│   └── components/
│       ├── overview.md         # Components overview
│       └── *.md                # Individual component docs
├── package.json
└── README.md
```

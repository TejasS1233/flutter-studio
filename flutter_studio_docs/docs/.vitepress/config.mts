import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'Flutter Studio',
  description: 'Production-ready Flutter components that you own',
  
  themeConfig: {
    logo: '/logo-64x64.png',
    
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Documentation', link: '/docs/introduction' },
      { text: 'Components', link: '/components/overview' },
      { text: 'Playground', link: 'https://flutterstudio.vercel.app' }
    ],
    
    outline: {
      level: [2, 3],
      label: 'On this page'
    },

    sidebar: [
      {
        text: 'Getting Started',
        items: [
          { text: 'Introduction', link: '/docs/introduction' },
          { text: 'Installation', link: '/docs/installation' },
          { text: 'CLI vs Package', link: '/docs/cli-vs-package' },
          { text: 'Theming', link: '/docs/theming' }
        ]
      },
      {
        text: 'Components',
        items: [
          { text: 'Overview', link: '/components/overview' },
          {
            text: 'Buttons & Inputs',
            collapsed: false,
            items: [
              { text: 'Button', link: '/components/button' },
              { text: 'Text Field', link: '/components/textfield' },
              { text: 'Text Area', link: '/components/textarea' },
              { text: 'Checkbox', link: '/components/checkbox' },
              { text: 'Radio', link: '/components/radio' },
              { text: 'Switch', link: '/components/switch' },
              { text: 'Slider', link: '/components/slider' },
              { text: 'Select', link: '/components/select' },
              { text: 'Dropdown', link: '/components/dropdown' }
            ]
          },
          {
            text: 'Layout',
            collapsed: false,
            items: [
              { text: 'Card', link: '/components/card' },
              { text: 'App Bar', link: '/components/appbar' },
              { text: 'Bottom Nav Bar', link: '/components/bottomnavbar' },
              { text: 'Tabs', link: '/components/tabs' },
              { text: 'Divider', link: '/components/divider' }
            ]
          },
          {
            text: 'Navigation',
            collapsed: false,
            items: [
              { text: 'Breadcrumb', link: '/components/breadcrumb' },
              { text: 'Pagination', link: '/components/pagination' }
            ]
          },
          {
            text: 'Feedback',
            collapsed: false,
            items: [
              { text: 'Alert', link: '/components/alert' },
              { text: 'Toast', link: '/components/toast' },
              { text: 'Dialog', link: '/components/dialog' },
              { text: 'Spinner', link: '/components/spinner' },
              { text: 'Progress', link: '/components/progress' },
              { text: 'Skeleton', link: '/components/skeleton' }
            ]
          },
          {
            text: 'Display',
            collapsed: false,
            items: [
              { text: 'Badge', link: '/components/badge' },
              { text: 'Chip', link: '/components/chip' },
              { text: 'Avatar', link: '/components/avatar' },
              { text: 'Tooltip', link: '/components/tooltip' },
              { text: 'Empty', link: '/components/empty' }
            ]
          },
          {
            text: 'Advanced',
            collapsed: false,
            items: [
              { text: 'Table', link: '/components/table' },
              { text: 'Accordion', link: '/components/accordion' },
              { text: 'Bottom Sheet', link: '/components/bottomsheet' },
              { text: 'Popover', link: '/components/popover' },
              { text: 'Form Field', link: '/components/formfield' },
              { text: 'Toggle Group', link: '/components/togglegroup' }
            ]
          }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/TejasS1233/flutter-studio' }
    ],

    footer: {
      copyright: 'Copyright © 2026 Flutter Studio | Created by Tejas S'
    },

    search: {
      provider: 'local'
    }
  },

  head: [
    ['link', { rel: 'icon', type: 'image/png', sizes: '32x32', href: '/logo-32x32.png' }],
    ['link', { rel: 'icon', type: 'image/png', sizes: '16x16', href: '/logo-32x32.png' }],
    ['link', { rel: 'apple-touch-icon', sizes: '180x180', href: '/logo-32x32.png' }],
    ['meta', { name: 'theme-color', content: '#0460c6' }],
    ['meta', { name: 'og:type', content: 'website' }],
    ['meta', { name: 'og:title', content: 'Flutter Studio' }],
    ['meta', { name: 'og:description', content: 'Production-ready Flutter components that you own' }]
  ]
})

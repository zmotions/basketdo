import { defineConfig } from 'vite';
import RubyPlugin from 'vite-plugin-ruby';
import FullReload from "vite-plugin-full-reload";
import Vue from '@vitejs/plugin-vue'
import ViteYaml from '@modyfi/vite-plugin-yaml';
import AutoImport from 'unplugin-auto-import/vite'
import * as path from "path";

export default defineConfig({
  test: {
    globals: true,
    environment: "jsdom",
  },
  plugins: [
    AutoImport({
      // targets to transform
      include: [
        /\.[tj]sx?$/, // .ts, .tsx, .js, .jsx
        /\.vue$/,
        /\.vue\?vue/, // .vue
        /\.md$/, // .md
      ],
      imports: [
        'vue',
        'vue-router',
        'vue-i18n'
      ]
    }),
    RubyPlugin(),
    Vue(),
    ViteYaml(),
    RubyPlugin(),
    FullReload(["config/routes.rb", "app/views/**/*"], { delay: 200 }),
  ],
  root: "./app/assets",
  build: {
    manifest: true,
    rollupOptions: {
      input: "/app/javascript/entrypoints/application.js"
    }
  },
  define: { "process.env": {} },
  server: {
    hmr: {
      host: 'localhost',
      protocol: 'ws'
    }
  },
  resolve: {
    alias: {
      '~bootstrap': path.resolve(__dirname, 'node_modules/bootstrap'),
    }
  },
})

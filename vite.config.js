import { defineConfig } from 'vite';
import ViteRails from 'vite-plugin-rails';
import Vue from '@vitejs/plugin-vue'
import ViteYaml from '@modyfi/vite-plugin-yaml';
import AutoImport from 'unplugin-auto-import/vite'
import * as path from "path";
import { config } from 'dotenv';

// the vite-plugin-ruby, part of vite-plugin-rails, exposed env variables that can be set for
// the backend and frontend, but both in backend and frontend dotenv needs to be installed to read
// from the .env - files and loaded accordingly, here with config(), does so automatically on the rails said
// when the gem is loaded
config();

export default defineConfig({
  test: {
    globals: true,
    environment: "jsdom",
  },
  plugins: [
    ViteYaml(),
    Vue(),
    ViteRails(),
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
  ],
  define: { "process.env": {} },
  resolve: {
    alias: {
      '~bootstrap': path.resolve(__dirname, 'node_modules/bootstrap'),
    }
  },
})

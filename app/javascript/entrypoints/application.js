
// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'

// You can specify which plugins you need
import { Tooltip, Toast, Popover } from 'bootstrap';

import Axios from "axios";
import { createApp } from 'vue';

import Home from '~/components/Home.vue';

const app = createApp(Home);

// API + Axios wrapper
import { createApi } from '~/plugins/api';
const Api = createApi({handler: Axios, namespace: ''});

// Pinia + Axios setup
import { createPinia } from 'pinia';
const Pinia = createPinia();
Pinia.use(({ store }) => { store.Api = Api })

// I18n loader
import { i18n, i18nPlugin } from '~/plugins/i18n';

import Router from '~/routes'

/* import font awesome icon component */
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

app.use(Router)
    .use(Pinia)
    .use(i18n)
    .use(i18nPlugin)
    .component('font-awesome-icon', FontAwesomeIcon)
    .mount('#app')
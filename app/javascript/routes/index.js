import { createWebHistory, createRouter } from 'vue-router'

import Home from '~/components/Home.vue';

const router = createRouter({
    history: createWebHistory(`/`),
    routes: [
        { path: '/', component: Home, name: 'root_path' }
    ]
});

// Handles 404 Not found
router.beforeEach((to, from, next) => {
    if (!to.matched.length) {
        window.location.href = '/404'
    } else {
        next();
    }
});

export default router;
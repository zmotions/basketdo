import { createWebHistory, createRouter } from 'vue-router'

import App from '~/components/App.vue';
import Home from "~/features/home/Home.vue";
import Dashboards from "~/features/dashboard/Dashboards.vue";
import Calendars from "~/features/calendar/Calendars.vue";
import Baskets from "~/features/basket/Baskets.vue";
import Goals from "~/features/goal/Goals.vue";
import Tasks from "~/features/task/Tasks.vue";
import Profile from "~/features/profile/Profile.vue";

const router = createRouter({
    linkActiveClass: 'active',
    history: createWebHistory(`/`),
    routes: [
        { path: '/', component: App, name: 'root_path', redirect: '/home' },
        { path: '/home', component: Home, name: 'home' },
        { path: '/dashboards', component: Dashboards, name: 'dashboards' },
        { path: '/calendars', component: Calendars, name: 'calendars' },
        { path: '/baskets', component: Baskets, name: 'baskets' },
        { path: '/goals', component: Goals, name: 'goals' },
        { path: '/tasks', component: Tasks, name: 'tasks' },
        { path: '/profile', component: Profile, name: 'profile' },
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
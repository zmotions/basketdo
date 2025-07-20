<script setup>
import UserMenu from "~/components/navigation/navbar/UserMenu.vue";
import SearchBar from "~/components/navigation/navbar/SearchBar.vue";
</script>

<template>
  <nav class="basketdo-nav navbar navbar-dark bg-dark navbar-expand-lg">
    <div class="container-fluid">
      <RouterLink to="/"
                  class="navbar-brand"
                  v-text="$t('navigation.navbar.brand')"/>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">
          <li class="nav-item">
            <RouterLink to="home"
                        class="nav-link"
                        aria-current="page"
                        v-text="$t('navigation.navbar.home')"/>
          </li>
          <li class="nav-item">
            <RouterLink to="dashboards"
                        class="nav-link"
                        aria-current="page"
                        v-text="$t('navigation.navbar.dashboards')"/>
          </li>
          <li class="nav-item">
            <RouterLink to="calendars"
                        class="nav-link"
                        aria-current="page"
                        v-text="$t('navigation.navbar.calendars')"/>
          </li>
          <li class="nav-item">
            <RouterLink to="baskets"
                        class="nav-link"
                        aria-current="page"
                        v-text="$t('navigation.navbar.baskets')"/>
          </li>
          <li class="nav-item">
            <RouterLink to="goals"
                        class="nav-link"
                        aria-current="page"
                        v-text="$t('navigation.navbar.goals')"/>
          </li>
          <li class="nav-item">
            <RouterLink to="tasks"
                        class="nav-link"
                        aria-current="page"
                        v-text="$t('navigation.navbar.tasks')"/>
          </li>
        </ul>
        <div class="me-auto"></div>
        <SearchBar/>
        <div class="ms-2"></div>
        <UserMenu/>
      </div>
    </div>
  </nav>
</template>
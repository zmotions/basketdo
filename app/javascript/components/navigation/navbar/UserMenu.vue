<template>
  <ul class="navbar-nav mb-2 mb-lg-0">
    <li class="nav-item">
      <div class="dropdown">
        <a class="nav-link dropdown-toggle"
           href="#" role="button"
           data-bs-toggle="dropdown"
           aria-expanded="false">
          <font-awesome-icon icon="fas fa-user"></font-awesome-icon>
        </a>
        <ul class="dropdown-menu dropdown-menu-end">
          <li>
            <RouterLink to="profile"
                        class="dropdown-item"
                        aria-current="page">
              <font-awesome-icon icon="fas fa-address-card"/>
              <span class="mx-1" v-text="$t('navigation.navbar.profile')"></span>
            </RouterLink>
          </li>
          <li>
            <a class="dropdown-item" href="#">
              <font-awesome-icon icon="fas fa-right-from-bracket"/>
              Logout
            </a>
          </li>
        </ul>
      </div>
    </li>
  </ul>
</template>
<script setup lang="ts">
</script>
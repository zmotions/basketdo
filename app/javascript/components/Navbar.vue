<script setup>
import UserMenu from "~/components/UserMenu.vue";
import SearchBar from "~/components/SearchBar.vue";
</script>

<template>
  <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#" v-text="$t('navbar.app_name')"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <SearchBar/>
        <UserMenu/>
      </div>
    </div>
  </nav>
</template>
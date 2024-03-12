<script setup>

import Navbar from "~/components/Navbar.vue";
</script>

<template>
  <Navbar/>
  <div class="container-fluid">
    <h1 v-text="$t('hello')"></h1>
  </div>
</template>
<script setup>
import Navbar from "~/components/navigation/Navbar.vue";
import Content from "~/components/layout/Content.vue";
</script>

<template>
  <div class="basketdo-app">
    <Navbar/>
    <Content/>
  </div>
</template>

<style lang="scss" scoped>
.basketdo-app{
  display: flex;
  flex-direction: column;
  height: 100%;
  width: 100%;
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  box-sizing: border-box;
}
</style>
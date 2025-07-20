<script setup>
import Sidebar from "~/components/navigation/Sidebar.vue";

const selectionIndex = ref(0);

function loadSelection(index){
  selectionIndex.value = index;
}
</script>

<template>
  <div class="basketdo-home">
    <Sidebar :selection-index="selectionIndex"
             :items="[{name: 'Dashboard 1'}, {name: 'Dashboard 1'}, {name: 'Dashboard 1'}, {name: 'Dashboard 1'}]"
             @selection="loadSelection"
    />
    <div class="basketdo-home__content">
      <h1>Home</h1>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.basketdo-home{
  display: flex;
  height: 100%;
  width: 100%;
  &__content {
    flex-basis: 100%;
    flex-grow: 1;
    height: 100%;
  }
}
</style>
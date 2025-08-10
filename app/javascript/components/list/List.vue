<script setup>

</script>

<template>
<div class="container-fluid">
  <div class="row g-2">
    <div v-if="$slots.sidebar" class="col-3">
      <slot name="sidebar"></slot>
    </div>
    <div :class="{'col': !$slots.sidebar, 'col-9': $slots.sidebar}">
      <div class="row row-cols-1">
        <div class="col">
          <slot name="filter"></slot>
        </div>
        <div class="col mt-2">
          <slot name="actions"></slot>
        </div>
      </div>
      <div class="row mt-2">
        <div class="col">
          <slot name="items"></slot>
        </div>
      </div>
      <div class="row mt-2">
        <div class="col">
          <slot name="pagination"></slot>
        </div>
      </div>
    </div>
  </div>
</div>
</template>

<style scoped lang="scss">

</style>
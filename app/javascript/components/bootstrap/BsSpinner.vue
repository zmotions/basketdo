<script setup>
defineProps({
  loading: {
    type: Boolean,
    default: false
  },
})
</script>

<template>
<div v-if="loading" class="b-bs-spinner d-inline-block ms-1">
  <font-awesome-icon icon="fas fa-spinner" spin-pulse></font-awesome-icon>
</div>
</template>

<style scoped lang="scss">
</style>
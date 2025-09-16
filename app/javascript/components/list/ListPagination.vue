<script setup>
import {createPageTemplate} from "@/features/task/templates/pagination-template.js";

defineProps({
  pagination: {
    type: Object,
    default: () => (createPageTemplate()),
  },
  listKey: {
    type: String,
    default: 'pagination'
  }
})
</script>

<template>
  <nav aria-label="Tasks pagination">
    <ul class="pagination flex-wrap mb-1">
      <li class="page-item">
        <a class="page-link" :class="{disabled: !pagination.previous}" href="#"
           @click="$emit('refresh', pagination.current - 1)">Previous</a>
      </li>
      <li class="page-item" v-for="(page, index) in pagination.range" :key="listKey + page + index">
        <a v-if="page === 'ellipsis'" disabled class="page-link" v-text="'...'"></a>
        <a v-else class="page-link" :class="{active: pagination.current === page}" href="#"
           @click="$emit('refresh', page)" v-text="page"></a>
      </li>
      <li class="page-item">
        <a class="page-link" :class="{disabled: !pagination.next}" href="#"
           @click="$emit('refresh', pagination.current + 1)">Next</a>
      </li>
    </ul>
    <div class="d-flex gap-2">
      <a v-for="per_page in pagination.steps"
         :key="listKey + 'steps' + per_page"
         :class="pagination.per_page === per_page? 'page-link' : 'link link-underline link-underline-opacity-0'"
         @click="$emit('refresh',pagination.current, per_page)"
         href="#"
         v-text="per_page"></a>
    </div>
    <sup class="text-muted">Showing {{ pagination.summary.range }} of {{pagination.summary.total}}</sup>
  </nav>
</template>

<style scoped lang="scss">

</style>
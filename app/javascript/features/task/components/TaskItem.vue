<script setup>
import {lxFormatDate, lxDueIn} from "~/components/filters/time-filter.js";
import {FontAwesomeIcon} from "@fortawesome/vue-fontawesome";

defineProps({
  task: {
    type: Object,
    required: true
  }
})

const collapsed = ref(true);
</script>

<template>
  <div class="basketdo-task-item card" @click.stop.prevent="collapsed = !collapsed">
    <div class="card-header bg-light py-1 px-2">
      <div class="d-flex align-items-center">
        <strong class="flex-grow-1" v-text="task.name"></strong>
        <div class="card-header__actions">
          <button type="button" class="btn btn-sm btn-light" @click.stop.prevent="$emit('edit', task.id)">
            <font-awesome-icon icon="fas fa-edit"></font-awesome-icon>
          </button>
          <button type="button" class="btn btn-sm btn-light text-danger" @click.stop.prevent="$emit('delete', task.id)">
            <font-awesome-icon icon="fas fa-trash"></font-awesome-icon>
          </button>
          <button class="btn btn-sm btn-light" @click.stop.prevent="collapsed = !collapsed">
            <font-awesome-icon :icon="['fas', !collapsed ? 'fa-chevron-down' : 'fa-chevron-up']"></font-awesome-icon>
          </button>
        </div>
      </div>
    </div>
    <div v-if="!collapsed" class="card-body py-1 px-2">
      <div class="card-badges">
          <span v-if="task.category" class="badge bg-secondary-subtle text-secondary me-1">
            <font-awesome-icon icon="fa fa-cat"></font-awesome-icon>
            <strong class="ms-1">{{ task.category.name }}</strong>
          </span>
          <span class="badge bg-secondary-subtle text-secondary me-1">
            <font-awesome-icon icon="fa fa-calendar"></font-awesome-icon>
            <strong class="ms-1">{{ lxFormatDate(task.due_on) }}</strong>
          </span>
        <span class="badge bg-secondary-subtle text-secondary me-1">
            <font-awesome-icon icon="fa fa-clock"></font-awesome-icon>
            <strong class="ms-1">{{ task.duration }}h</strong>
          </span>
        <span class="badge bg-secondary-subtle text-secondary me-1">
            <font-awesome-icon icon="fa fa-hourglass"></font-awesome-icon>
            <strong class="ms-1">{{ lxDueIn(task.due_on) }}</strong>
          </span>
      </div>
      <div class="card-text">
        <div class="mt-2">
          <p class="text-muted" v-text="task.description"></p>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.basketdo-task-item{
  cursor: pointer;
}
</style>
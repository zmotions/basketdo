<script setup>
defineProps({
  selectionIndex: {
    type: Number,
    default: 0
  },
  items: {
    type: Array,
    required: false,
    default: () => []
  }
})

const sidebarExpanded = ref(false);

function toggleSidebar() {
  sidebarExpanded.value = !sidebarExpanded.value;
}

</script>

<template>
  <div v-if="items.length" class="basketdo-sidebar" :class="{'basketdo-sidebar--expanded': sidebarExpanded}">
    <div class="d-flex flex-column flex-grow-1 flex-shrink-0 bg-dark">
      <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
        <li class="nav-item " v-for="(item, index) in items" :key="index">
          <!-- TODO: when backend ready, change selectionIndex with item id -->
          <a href="#"
             @click="$emit('selection', index)"
             class="nav-link py-3 border-bottom"
             :class="{'link-light': !item.active && index !== selectionIndex, 'active': item.active || index === selectionIndex}"
             aria-current="page">
            <font-awesome-icon icon="fas fa-user"></font-awesome-icon>
            <span v-if="sidebarExpanded"
                  class="ms-2"
                  v-text="item.name"></span>
          </a>
        </li>
      </ul>
      <div class="flex-end">
        <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
          <li class="nav-item">
            <a href="#" class="nav-link link-light py-3" @click="toggleSidebar">
              <font-awesome-icon :icon="sidebarExpanded ? 'fas fa-chevron-left' : 'fas fa-chevron-right'"></font-awesome-icon>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.basketdo-sidebar {
  display: flex;
  flex-direction: column;
  width: 4rem;
  height: 100%;

  &--expanded {
    flex-basis: 16rem;
    flex-shrink: 0;
  }

  .nav-link {
    width: 100%;
  }

  .nav-flush .nav-link {
    border-radius: 0;
  }
  .bg-dark{
    background-color: #25333c !important;
  }
}
</style>
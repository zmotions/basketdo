<script setup>
import ListSidebar from "@/components/list/ListSidebar.vue";
</script>

<template>
  <ListSidebar>
    <div class="d-flex flex-column">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search tasks..." aria-label="Task search input"
               aria-describedby="button-addon2">
        <button class="btn btn-primary" type="button" id="button-addon2">
          <font-awesome-icon icon="fa fa-search"></font-awesome-icon>
        </button>
      </div>
      <div v-for="(_, index) in Array(3)" class="card mt-2" :key="index">
        <div class="card-body">
          <h5 class="card-title">Basket {{ index }}</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-outline-primary">Details</a>
        </div>
      </div>
    </div>
  </ListSidebar>
</template>

<style scoped lang="scss">

</style>
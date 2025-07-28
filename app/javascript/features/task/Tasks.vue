<script setup>
import {onMounted} from "vue";
import {httpClient} from '~/plugins/api.js';
import Sidebar from "~/components/navigation/Sidebar.vue";
import List from "~/components/list/List.vue";
import TaskItem from "~/features/task/components/TaskItem.vue";
import {createTaskTemplate} from "~/features/task/templates/task-template.js";
import TaskModal from "~/features/task/modals/TaskModal.vue";

const tasks = ref([]);
const categories = ref([]);
const showDialog = ref(false);
const currentTask = ref(createTaskTemplate());
const creatingTask = ref(false);

function showTaskDialog() {
  showDialog.value = true;
}

function closeTaskDialog() {
  showDialog.value = false;
}

function loadTasks() {
  return httpClient.get("/tasks.json")
      .then(res => {
        tasks.value = res.data.list;
      })
}

function loadCategories() {
  return httpClient.get("/categories.json")
      .then(res => {
        categories.value = res.data;
      })
}

function createTask() {
  creatingTask.value = true;
  return httpClient.post("/tasks.json", currentTask.value)
      .then(() => {
        creatingTask.value = false;
        closeTaskDialog();
        clearTask();
        loadTasks();
      })
      .catch((err) => console.log(err))
      .then(() => creatingTask.value = false);
}

function deleteTask(id) {
  return httpClient.delete(`/tasks/${id}.json`)
      .then(() => {
        loadTasks();
      })
      .catch((err) => console.log(err));
}

function clearTask() {
  currentTask.value = createTaskTemplate();
}

onMounted(() => {
  loadTasks();
  loadCategories();
})

</script>

<template>
  <div class="basketdo-tasks">
    <Sidebar>
      <template #items>
        <li class="nav-item">
          <a href="#" @click="showTaskDialog"
             class="nav-link link-light py-3">
            <font-awesome-icon icon="fas fa-plus"></font-awesome-icon>
          </a>
        </li>
      </template>
    </Sidebar>
    <div class="basketdo-tasks__content">
      <List>
        <template #sidebar>
          <h1>Sidebar</h1>
        </template>
        <template #filter>
          <div class="row g-2 mt-0">
            <div class="col-8">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search tasks..." aria-label="Task search input"
                       aria-describedby="button-addon2">
                <button class="btn btn-primary" type="button" id="button-addon2">
                  <font-awesome-icon icon="fa fa-search"></font-awesome-icon>
                </button>
              </div>
            </div>
            <div class="col-4">
              <select class="form-select" aria-label="Default select example">
                <option selected>Category...</option>
                <option v-for="category in categories"
                        :value="category.id"
                        v-text="category.name"
                        :key="category.id">
                </option>
              </select>
            </div>
          </div>
        </template>
        <template #actions>
          <div class="row g-2">
            <div class="col-8">
              <ul class="nav nav-pills">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Cards</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">List</a>
                </li>
              </ul>
            </div>
            <div class="col-4">
              <div class="d-flex justify-content-end">
                <button class="btn btn-success" @click="showTaskDialog">New Task</button>
              </div>
            </div>
          </div>
        </template>
        <template #items>
          <div class="row g-2">
            <div class="col-6" v-for="task in tasks" :key="task.id">
              <TaskItem :task="task" @delete="deleteTask"/>
            </div>
          </div>
        </template>
        <template #pagination>
          <nav aria-label="Page navigation example">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="#">Previous</a></li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
          </nav>
        </template>
      </List>
    </div>

    <TaskModal :task="currentTask"
               :show="showDialog"
               :loading="creatingTask"
               @close="closeTaskDialog"
               @create="createTask"/>
  </div>
</template>

<style scoped lang="scss">
.basketdo-tasks {
  display: flex;
  height: 100%;
  width: 100%;

  &__content {
    flex-basis: 100%;
    height: calc(100% - 55px);
    flex-grow: 1;
    overflow: auto;
  }
}
</style>
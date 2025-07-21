<script setup>
import {onMounted} from "vue";
import { httpClient } from '~/plugins/api.js';
import Sidebar from "~/components/navigation/Sidebar.vue";
import {FontAwesomeIcon} from "@fortawesome/vue-fontawesome";
const tasks = ref([]);
const showDialog = ref(false);
const taskTemplate = {
  name: '',
  description: '',
  due_on: null,
  estimated: 0
};
const currentTask = ref(taskTemplate);

function showTaskDialog(){
  showDialog.value = true;
}
function closeTaskDialog(){
  showDialog.value = false;
}

function loadTasks() {
  httpClient.get("/tasks.json")
      .then(res => {
        tasks.value = res.data;
      })
}

function createTask(){
  httpClient.post("/tasks.json", currentTask.value)
      .then(() => {
        closeTaskDialog();
        clearTask();
        loadTasks();
      })
      .catch((err) => console.log(err));
}

function deleteTask(id){
  httpClient.delete(`/tasks/${id}.json`)
      .then(() => {
        loadTasks();
      })
      .catch((err) => console.log(err));
}

function clearTask(){
  currentTask.value = taskTemplate;
}

onMounted(() => {
  loadTasks();
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
      <div v-for="task in tasks" :key="task.id" class="card">
        <div class="card-body">
          <h5 class="card-title" v-text="task.name"></h5>
          <h6 class="card-subtitle mb-2 text-muted" v-text="task.description"></h6>
          <p class="card-text">Estimated: {{ task.estimated }}, Due date: {{ task.due_on }}</p>
          <button type="button" class="btn btn-outline-danger" @click="deleteTask(task.id)">Delete</button>
        </div>
      </div>
    </div>

    <!-- Modal -->

    <div v-if="showDialog" class="modal-backdrop fade show"></div>
    <div class="modal fade" :class="{ show: showDialog, 'd-block': showDialog }" id="staticBackdrop" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="staticBackdropLabel">New Task</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label for="exampleFormControlInput1" class="form-label">Name</label>
              <input v-model="currentTask.name" type="text" class="form-control" id="exampleFormControlInput1" placeholder="Task name...">
            </div>
            <div class="mb-3">
              <label for="exampleFormControlTextarea1" class="form-label">Description</label>
              <textarea v-model="currentTask.description" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            <div class="mb-3">
              <label for="exampleFormControlInput1" class="form-label">Estimation (hours)</label>
              <input v-model="currentTask.estimated" type="number" class="form-control" id="exampleFormControlInput1" placeholder="0">
            </div>
            <div class="mb-3">
              <label for="exampleFormControlInput1" class="form-label">Due Date</label>
              <input v-model="currentTask.due_on" type="date" class="form-control" id="exampleFormControlInput1" placeholder="Due on...">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" @click="closeTaskDialog">Cancel</button>
            <button type="button" class="btn btn-primary" @click="createTask">Create</button>
          </div>
        </div>
      </div>
    </div>
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
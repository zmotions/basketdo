<script setup>
import BsModal from "~/components/bootstrap/BsModal.vue";
import BsSpinner from "~/components/bootstrap/BsSpinner.vue";

defineProps({
  show: {
    type: Boolean,
    default: false
  },
  loading: {
    type: Boolean,
    default: false
  },
  modalWidth: {
    type: Number,
    default: undefined
  },
  modalHeight: {
    type: Number,
    default: undefined
  },
  task: {
    type: Object,
    required: true
  }
});
</script>

<template>
  <BsModal class="basketdo-task-modal" :show="show" :modalWidth="modalWidth" :modalHeight="modalHeight">
    <template #header>
      <h5 class="modal-title">New Task</h5>
    </template>
    <template #body>
      <div class="mb-3">
        <label for="taskNameInput" class="form-label">Name</label>
        <input v-model="task.name" type="text" class="form-control" id="taskNameInput"
               placeholder="Task name...">
      </div>
      <div class="mb-3">
        <label for="taskDescriptionInput" class="form-label">Description</label>
        <textarea v-model="task.description" class="form-control" id="taskDescriptionInput" rows="3"></textarea>
      </div>
      <div class="mb-3">
        <label for="taskEstimatedInput" class="form-label">Estimation (hours)</label>
        <input v-model="task.estimated" type="number" class="form-control" id="taskEstimatedInput"
               placeholder="0">
      </div>
      <div class="mb-3">
        <label for="taskDueOnInput" class="form-label">Due Date</label>
        <input v-model="task.due_on" type="date" class="form-control" id="taskDueOnInput"
               placeholder="Due on...">
      </div>
    </template>
    <template #footer>
      <button type="button" class="btn btn-secondary" @click="$emit('close')">Cancel</button>
      <button type="button" class="btn btn-primary" @click="$emit('create')">
        Create
        <BsSpinner :loading="loading"></BsSpinner>
      </button>
    </template>
  </BsModal>
</template>

<style scoped lang="scss">

</style>
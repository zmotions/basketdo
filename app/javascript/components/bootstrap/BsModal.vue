<script setup>
defineProps({
  show: {
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
  }
})
</script>

<template>
  <div v-if="show" class="bd-bs-modal">
    <div class="modal-backdrop fade show"></div>
    <div id="bsModalLabel"
         tabindex="-1"
         class="modal fade"
         :class="{ show: show, 'd-block': show }">
      <div class="modal-dialog"
           :style="{width: modalWidth, maxWidth: modalWidth}">
        <div class="modal-content" :style="{maxHeight: modalHeight, height: modalHeight}">
          <div class="modal-header">
            <slot name="header">
              <h5 class="modal-title" id="bsModalLabel">Modal</h5>
            </slot>
            <button type="button" class="btn-close" @click="$emit('close')" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <slot name="body"></slot>
          </div>
          <div class="modal-footer">
            <slot name="footer"></slot>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
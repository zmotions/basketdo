import { describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import Tasks from "~/features/task/Tasks.vue";

describe('Tasks.vue', () => {
    it('foo', async () => {
        const wrapper = await mount(Tasks);
        await flushPromises();
        expect(wrapper.text()).toContain("Tasks");
    })
})
import { describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import Goals from "~/features/goal/Goals.vue";

describe('Goals.vue', () => {
    it('foo', async () => {
        const wrapper = await mount(Goals);
        await flushPromises();
        expect(wrapper.text()).toContain("Goals");
    })
})
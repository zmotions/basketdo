import { describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import Sidebar from "~/components/navigation/Sidebar.vue";

describe('Sidebar.vue', () => {
    it.skip('foo', async () => {
        const wrapper = await mount(Sidebar);
        await flushPromises();
        expect(wrapper).not.toBeNull();
    })
})
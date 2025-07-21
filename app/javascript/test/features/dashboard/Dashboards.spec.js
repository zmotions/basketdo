import { describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import Dashboards from "~/features/dashboard/Dashboards.vue";

describe('Dashboards.vue', () => {
    it('foo', async () => {
        const wrapper = await mount(Dashboards);
        await flushPromises();
        expect(wrapper.text()).toContain("Dashboards");
    })
})
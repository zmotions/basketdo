import { describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import Navbar from "~/components/navigation/Navbar.vue";

describe('Navbar.vue', () => {
    it.skip('foo', async () => {
        const wrapper = await mount(Navbar);
        await flushPromises();
        expect(wrapper).not.toBeNull();
    })
})
import { describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import UserMenu from "~/components/navigation/navbar/UserMenu.vue";

describe('UserMenu.vue', () => {
    it.skip('foo', async () => {
        const wrapper = await mount(UserMenu);
        await flushPromises();
        expect(wrapper).not.toBeNull();
    })
})
import { describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import Profile from "~/features/profile/Profile.vue";

describe('Profile.vue', () => {
    it('foo', async () => {
        const wrapper = await mount(Profile);
        await flushPromises();
        expect(wrapper.text()).toContain("Profile");
    })
})
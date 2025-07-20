import { describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import App from "~/components/App.vue";

describe('App.vue', () => {
    it('foo', async () => {
        const wrapper = await mount(App);
        await flushPromises();
        expect(wrapper.text()).toContain("Hello World");
    })
})
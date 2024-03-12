import { assert, describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import Home from "~/components/Home.vue";

describe('Home.vue', () => {
    it('foo', async () => {
        const wrapper = await mount(Home);
        await flushPromises();
        expect(wrapper.text()).toContain("Hello World");
    })
})
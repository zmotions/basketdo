import { describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import Content from "~/components/layout/Content.vue";

describe('Content.vue', () => {
    it('foo', async () => {
        const wrapper = await mount(Content);
        await flushPromises();
        expect(wrapper).not.toBeNull();
    })
})
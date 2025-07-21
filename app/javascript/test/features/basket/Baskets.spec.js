import { describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import Baskets from "~/features/basket/Baskets.vue";

describe('Baskets.vue', () => {
    it('foo', async () => {
        const wrapper = await mount(Baskets);
        await flushPromises();
        expect(wrapper.text()).toContain("Baskets");
    })
})
import { describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import SearchBar from '~/components/navigation/navbar/SearchBar.vue'

describe('SearchBar.vue', () => {
    it.skip('foo', async () => {
        const wrapper = await mount(SearchBar);
        await flushPromises();
        expect(wrapper).not.toBeNull();
    })
})
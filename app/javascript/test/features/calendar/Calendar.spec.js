import { describe, expect, it } from 'vitest'
import { mount, flushPromises } from '@vue/test-utils';
import Calendars from "~/features/calendar/Calendars.vue";

describe('Calendars.vue', () => {
    it('foo', async () => {
        const wrapper = await mount(Calendars);
        await flushPromises();
        expect(wrapper.text()).toContain("Calendars");
    })
})
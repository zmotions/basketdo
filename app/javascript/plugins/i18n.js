import { createI18n } from 'vue-i18n';

const htmlLang = document.querySelector('html').getAttribute('lang')

function loadLocaleMessages() {
    const locales = import.meta.glob('../../../config/locales/*.yml', {eager: true})
    const messages = {}
    for (const path in locales) {
        const locale = path.match(/([A-Za-z0-9-_]+)\.yml$/i)[1]
        messages[locale] = locales[path].default[locale]
    }
    return messages
}

export const i18n = createI18n({
    legacy: false,
    locale: htmlLang,
    messages: loadLocaleMessages(),
})

export const i18nPlugin = {
    install: (app) => {
        app.config.globalProperties.$t = i18n.global.t
    }
}

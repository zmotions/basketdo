const PAGINATION_TEMPLATE = {
    current: 1,
    previous: null,
    next: null,
    per_page: 25,
    pages: 1,
    count: 0,
    range: [1],
    steps: [25, 50, 100, 250, 500],
    summary: {
        range: '0-0',
        total: 0
    }
}

export function createPageTemplate() {
    return Object.assign({}, PAGINATION_TEMPLATE);
}
const TASK_TEMPLATE = {
    name: '',
    description: '',
    due_on: null,
    duration: 0
};


export function createTaskTemplate() {
    return Object.assign({}, TASK_TEMPLATE);
}
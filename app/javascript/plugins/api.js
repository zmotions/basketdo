import Axios from "axios";
const csrfToken = document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute("content");
const instance = Axios.create({
    baseURL: '/api/v1/',
    timeout: 1000,
    headers: { 'X-CSRF-Token': csrfToken }
});
instance.interceptors.response.use(
    (response) => {
        return response;
    },
    (error) => {
        switch (error.response.status) {
            case 500:
                window.location.href = "/500";
                break;
            case 401:
                alert("not authenticated");
                break;
        }

        return Promise.reject(error);
    }
);

export const httpClient = instance;
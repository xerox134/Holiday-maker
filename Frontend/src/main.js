import { createApp } from 'vue'
import App from './App.vue'
import router from './router/router'
import store from './store/store'
import PrimeVue from 'primevue/config';
import Calendar from 'primevue/calendar'
import PrimeIcons from 'primevue/api';

createApp(App).use(PrimeIcons).use(Calendar).use(PrimeVue).use(store).use(router).mount('#app')

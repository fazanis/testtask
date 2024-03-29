
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

import VueRouter from 'vue-router'

Vue.use(VueRouter);


let routes = [
    { path: '/', component: require('./components/DealListComponent.vue'),name:'home' },
    { path: '/contact/:id', component: require('./components/ExampleComponent.vue'), name:'contact'}
];

const router = new VueRouter({
    routes // сокращённая запись для `routes: routes`
});
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('example-component', require('./components/ExampleComponent.vue'));
Vue.component('deallist-component', require('./components/DealListComponent.vue'));

const app = new Vue({
    el: '#app',
    router
});

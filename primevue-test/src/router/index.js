


import { createWebHistory, createRouter } from "vue-router";
import AddUser from "../addUser.vue";
import home from "../home.vue";
import addRequest from "../addRequest.vue"
import getRequest from "../getRequest.vue"

const routes = [
  {
    path: "/",
    name: "AddUser",
    component: AddUser,
  },
  {
    path: "/home",
    name: "home",
    component: home,
  },
  {
    path: "/addRequest",
    name: "addRequest",
    component: addRequest,
  },
  {
    path: "/getRequest",
    name: "getRequest",
    component: getRequest,
  },
 
 
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
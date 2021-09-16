import Vue from 'vue'
import VueRouter from 'vue-router'
import Client from "../components/Client";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Client',
    component: Client
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Rooms from '../views/Rooms.vue'
import Bookings from '../views/Bookings.vue'
import Ongoingbooking from '../views/Ongoingbooking.vue'
import Reviews from  '../views/Reviews.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/favorites',
    name: 'Favorites',
    component: () => import('../views/Favorites.vue')
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/bookings',
    name: 'Bookings',
    component: Bookings
  },
  {
    path: '/room',
    component: Rooms,
    name: 'rooms'
    
  },
  {
    path: '/ongoingbooking',
    component: Ongoingbooking,
    name: 'ongoingbooking'
  },
  {
    path: '/reviews',
    name: 'Reviews',
    component: Reviews
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router

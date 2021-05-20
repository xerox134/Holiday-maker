import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Hotel from '../views/Hotel.vue'
import Bookings from '../views/Bookings.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    component: () => import('../views/About.vue')
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
    path: '/hotel',
    component: Hotel,
    name: 'hotel'
    
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router

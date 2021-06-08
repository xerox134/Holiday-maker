import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Hotel from '../views/Hotel.vue'
import Bookings from '../views/Bookings.vue'
import Ongoingbooking from '../views/Ongoingbooking.vue'
import { Checkout } from 'stripe/lib/resources'
import CheckoutResult from '/src/components/CheckoutResult.vue'

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
    path: '/hotel',
    component: Hotel,
    name: 'hotel'

  },
  {
    path: '/ongoingbooking',
    component: Ongoingbooking,
    name: 'ongoingbooking'
  },
  {
    path: '/checkout',
    name: 'Checkout',
    component: Checkout,
  },
  {
    path: '/checkout-result/:result',
    name: 'CheckoutResult',
    component: CheckoutResult,
  }



]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router

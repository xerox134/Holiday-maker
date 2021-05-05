import { createStore } from 'vuex';
import axios from 'axios';

export default createStore({
    name:'store',
  state: {
      hotels:[],
      loggedInUser: null
  },
  mutations: {
    addHotels(state, payload) {
        state.hotels = payload;
      },
      setLoggedInUser (state, user) {
        state.loggedInUser = user
      }
  },
  
  actions: {
    async fetchHotels(){
        await axios.get("http://localhost:3000/rest/hotels")
        .then(response => {
          this.commit("addHotels", response.data)
          console.log(response.data)
        })
      },
      async fetchUser(){
        await axios.get("http://localhost:3000/auth/whoami/")
        .then(response => {
          this.commit("setUser", response.data)
          if(response != null)
            console.log(response.data)
        })
      },
      
  },
  
  modules: {
  }
})

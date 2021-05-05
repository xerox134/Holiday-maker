import { createStore } from 'vuex';
import axios from 'axios';

export default createStore({
    name:'store',
  state: {
    favorites: [],
    addedFavorites:[]
      hotels:[],
  },
  
  mutations: {
    addHotels(state, payload) {
        state.hotels = payload;
      },
    setFavorites(state,payload){
      state.favorites = payload;
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
    async fetchAllFavorites(){
      await axios.get("http://localhost:3000/rest/favorites/1")
      .then(response => {
      this.commit("setFavorites", response.data)
      console.log(response.data)
    })
  },
  },

  getters:{
    getAllFavorites(state){
      return state.favorites
    }

  },


  modules: {
  }
})
